use hex::FromHex;
//use std::thread::sleep;
//use std::time::Duration;
use std::sync::Mutex;
#[cfg(any(target_os = "macos", target_os = "windows"))]
use hidapi::{HidApi, HidDevice};
use crate::Result;
use super::error::HidError;
use crate::message::send_apdu;
//use std::collections::HashMap;


#[cfg(any(target_os = "macos", target_os = "windows"))]
lazy_static! {
    pub static ref HID_API: Mutex<HidApi> = Mutex::new(HidApi::new().expect("hid_initialization_error"));
    pub static ref HID_DEVICE: Mutex<Vec<HidDevice>> = Mutex::new(vec![]);
//    static ref DEVICE_CONN_INFO: HashMap<&'static str, (u16, u16)> = {
//        let mut device_conn_info_map = HashMap::new();
//        device_conn_info_map.insert("imKey Pro", (0x096e, 0x0891));
//        device_conn_info_map
//    };
}

//const RETRY_SEC: u64 = 1;
const DEV_VID: u16 = 0x096e;
const DEV_PID: u16 = 0x0891;

pub fn hid_send(hid_device: &HidDevice, apdu: &String, timeout: i32) -> Result<String> {//TODO write失败后校验是否是拔掉了设备
    println!("-->{}", apdu);
    match send_device_message(hid_device, Vec::from_hex(apdu.as_str()).unwrap().as_slice()) {
        Ok(_val) => (),
        Err(err) => {
            is_conn_terminal()?;
            return Err(err.into());
        },
    };
    let return_data = match read_device_response(hid_device, timeout) {
        Ok(ret_data) => ret_data,
        Err(err) => {
            is_conn_terminal()?;
            return Err(err.into());
        },
    };
    let apdu_response = hex::encode_upper(return_data);
    println!("<--{}", apdu_response.clone());
    Ok(apdu_response)
}

#[allow(dead_code)]
fn first_write_read_device_response(device: &hidapi::HidDevice) -> Result<Vec<u8>> {
    let first_send_cmd: [u8; 8] = [0x00, 0x00, 0x00, 0x00, 0x01, 0x86, 0x00, 0x00];
    let mut send_first_data_string = String::new();
    for u in &first_send_cmd[..first_send_cmd.len()] {
        send_first_data_string.push_str((format!("{:02X}", u)).as_ref());
    }
    let _res = device.write(&first_send_cmd)?;
    let mut buf = vec![0; 64];
    device.read_timeout(&mut buf, 300_000)?;

    let mut receive_first_data_string = String::new();
    for u in &buf[..buf.len()] {
        receive_first_data_string.push_str((format!("{:02X}", u)).as_ref());
    }

    Ok(buf[..64].to_vec())
}

fn read_device_response(device: &hidapi::HidDevice, timeout: i32) -> Result<Vec<u8>> {
    let mut buf = vec![0; 64];

    device.read_timeout(&mut buf, 300_000)?;
    let msg_size = (buf[5] as u8 & 0xFF) + (buf[6] as u8 & 0xFF);
    let mut data = Vec::new();
    data.extend_from_slice(&buf[7..]);
    while data.len() < (msg_size as usize) {
        device.read_timeout(&mut buf, timeout * 1000)?;
        data.extend_from_slice(&buf[5..64]);
    }
    data.truncate(msg_size as usize);

    //打印收到的数据
    let mut receive_data_string = String::new();
    for u in &data[..data.len()] {
        receive_data_string.push_str((format!("{:02X}", u)).as_ref());
    }

    Ok(data[..msg_size as usize].to_vec())
}

fn send_device_message(device: &hidapi::HidDevice, msg: &[u8]) -> Result<usize> {
    let mut send_data_string = String::new();
    for u in &msg[..msg.len()] {
        send_data_string.push_str((format!("{:02X}", u)).as_ref());
    }

    let msg_size = msg.len();
    let mut headerdata = Vec::new();
    // first pack
    headerdata.push(0x00 as u8);
    headerdata.push(0x00 as u8);
    headerdata.push(0x00 as u8);
    headerdata.push(0x00 as u8);
    headerdata.push(0x01 as u8);
    headerdata.push(0x83 as u8);
    headerdata.push((msg_size & 0xFF00) as u8);
    headerdata.push((msg_size & 0x00FF) as u8);
    let mut data = Vec::new();
    if (msg_size + 8) < 65 {
        data.extend_from_slice(&headerdata[0..8]);
        data.extend_from_slice(&msg[0..msg_size]);
    } else {
        let mut datalenflage = 0;
        let mut flg = 0;
        loop {
            if msg_size - datalenflage < 65 - 8 {
                data.extend_from_slice(&headerdata[0..5]);
                data.push(flg as u8);
                data.extend_from_slice(&msg[datalenflage..msg_size]);
                break;
            } else {
                if !(datalenflage == 0) {
                    data.extend_from_slice(&headerdata[0..5]);
                    data.push(flg as u8);
                    flg = 1 + flg;
                    data.extend_from_slice(&msg[datalenflage..datalenflage + 65 - 6]);
                    datalenflage += 65 - 6;
                } else {
                    data.extend_from_slice(&headerdata[0..8]);
                    data.extend_from_slice(&msg[datalenflage..65 - 8]);
                    datalenflage += 65 - 8;
                }
            }
        }
    }

    while data.len() % 65 > 0 {
        data.push(0);
    }

    let total_written = 0;
    for chunk in data.chunks(65) {
        device.write(&chunk)?;
    }
    Ok(total_written)
}

pub fn hid_connect(device_model_name: &str) -> Result<()> {

    //Check if the device is connected to the terminal
    is_conn_terminal()?;

    //get hid initialization obj
    let mut hid_api = HID_API.lock().unwrap();

    //connect device
    match hid_api.open(DEV_VID, DEV_PID) {
        Ok(hid_device) => {
            println!("device connected!!!");
//            first_write_read_device_response(&hid_device);
            drop(hid_api);
            let mut hid_device_obj = HID_DEVICE.lock().unwrap();
            *hid_device_obj = vec![hid_device];
            drop(hid_device_obj);

            return Ok(());
        }
        Err(err) => {
            println!("device connect failed : {}", err);
            drop(hid_api);
            //Check if the connection is normal
            match send_apdu("00A40400".to_string()) {
                Ok(_apdu_res) =>{
                    return Ok(());
                } ,
                Err(_err) =>{
                    return Err(err.into());
                },
            }
        }
    };
}

pub fn is_conn_terminal() -> Result<()> {
    //get hid initialization obj
    let mut hid_api = HID_API.lock().unwrap();

    //refresh devices list
    hid_api.refresh_devices()?;

    //check the device is connect
    let mut connect_flg = false;
    for device_info in hid_api.device_list() {
        if device_info.vendor_id() == DEV_VID && device_info.product_id() == DEV_PID{
            connect_flg = true;
            break;
        };
    };
    drop(hid_api);
    if !connect_flg {
        println!("设备列表没发现设备");
        return Err(HidError::ImkeyDeviceIsNotConnect.into());
    };
    Ok(())
}

#[cfg(test)]
mod test{
    use crate::hid_api;
    use crate::message::send_apdu;
    use crate::hid_api::{ hid_connect, HID_DEVICE};

    #[test]
    fn hid_test(){
//        let hid_device = hid_api::hid_connect();
//        hid_api::hid_send(&hid_device, &"00A4040005695F62746300".to_string());
        hid_connect("imKey Pro");
        hid_connect("imKey Pro");
        send_apdu("00A4040005695F62746300".to_string());
//        device_connect("imkey pro");
//        send_apdu("00A4040005695F62746300".to_string());
//        lazy_static::initialize(&DEVICE);
//        println!("test");
    }
}

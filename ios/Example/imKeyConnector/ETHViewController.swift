//
//  ETHViewController.swift
//  imKeyConnector_Example
//
//  Created by joe on 7/17/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import imKeyConnector

class ETHViewController: UIViewController {
  
  var handle:UInt = 0
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  @IBOutlet weak var txtResult: UITextView!
  
  @IBAction func backClick(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func autoSignBtnClick(_ sender: Any) {
    txtResult.text = ""
    DispatchQueue.global().async {
      let result = ETHTest.testETHSign(handle: self.handle)
      Log.d(result)
      self.appendResult(msg: result.description)
    }
  }
  
  
  
  @IBAction func signBtnClick(_ sender: Any) {
    txtResult.text = ""
    let path = "m/44'/60'/0'/0/0"
    let signRes = try! Wallet.ethSignTransaction(
      handle: handle,
      raw:[        "nonce":        "7",
                   "gasPrice":     "21000000000",
                   "gasLimit":     "150000",
                   "to":           "0xE6F4142dfFA574D1d9f18770BF73814df07931F3",
                   "value":        "10000000000000000",
                   "data":                      "",
                   "preview":[
                    "payment":      "0.01 ETH",
                    "receiver":     "0xE6F4142dfFA574D1d9f18770BF73814df07931F3",
                    "sender":       "0xAfbaf132E587D67125A224B947133cB942E6E312",
                    "fee":          "0.0032 ether"
        ]
      ],chainID:61,path: path)
    
    txtResult.text = "eth sign transaction： \n \(signRes)"
  }
  
  @IBAction func signMsgBtnClick(_ sender: Any) {
    txtResult.text = ""
    do {
      let path = "m/44'/60'/0'/0/0"
      let data = "Hello imToken"
      let sender = "0xAfbaf132E587D67125A224B947133cB942E6E312"
      let sign = try Wallet.ethSignPersonalMessage(handle: handle, path: path, data: data, sender:sender)
      txtResult.text = "eth sign personal message： \n \(sign)"
      Log.d(sign)
    } catch let e as ImkeyError {
      Log.d("!!!error:\(e.message)")
      toastMsg(message: e.message)
    }catch{
      Log.d(error)
    }
  }
  
  @IBAction func addressBtnClick(_ sender: Any) {
    txtResult.text = ""
    do {
      let path = "m/44'/60'/0'/0/0"
      let address = try Wallet.getETHAddress(handle:handle, path: path)
      txtResult.text = "eth address： \n \(address)"
      Log.d(address)
    } catch let e as ImkeyError {
      Log.d("!!!error:\(e.message)")
      toastMsg(message: e.message)
    }catch{
      Log.d(error)
    }
  }
  
  func appendResult(msg:String){
    DispatchQueue.main.async {
      self.txtResult.text += msg
      let bottom = NSMakeRange(self.txtResult.text.count - 1, 1)
      self.txtResult.scrollRangeToVisible(bottom)
    }
  }
}

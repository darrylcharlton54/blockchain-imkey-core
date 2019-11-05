//
//  EOSViewController.swift
//  imKeyConnector_Example
//
//  Created by joe on 7/17/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import imKeyConnector

class EOSViewController: UIViewController {
  
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
      let result = EOSTest.testEOSign(handle: self.handle)
      Log.d(result)
      self.appendResult(msg: result.description)
    }
  }
  
  @IBAction func signBtnClick(_ sender: Any) {
    txtResult.text = ""
    let txs = [
      EOSTransaction(
        data: "c578065b93aec6a7c811000000000100a6823403ea3055000000572d3ccdcd01000000602a48b37400000000a8ed323225000000602a48b374208410425c95b1ca80969800000000000453595300000000046d656d6f00",
        publicKeys: ["EOS88XhiiP7Cu5TmAUJqHbyuhyYgd6sei68AU266PyetDDAtjmYWF"],
        chainID: "aca376f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906",
        to: "liujianmin12",
        from: "liujianmin13",
        payment: "sellram 0.0739 EOS"
      )
    ]
    
    do {
      let result = try EOSTransactionSigner(txs: txs, handle: handle,path:BIP44.EOS_LEDGER).sign()
      Log.d(result)
      txtResult.text = "eos sign result:\n\(result)"
    }catch let e as ImkeyError {
      Log.d("!!!error:\(e.message)")
      toastMsg(message: e.message)
    }catch{
      Log.d(error)
    }
  }
  
  @IBAction func signMsgBtnClick(_ sender: Any) {
    txtResult.text = ""
    let publicKey = "EOS88XhiiP7Cu5TmAUJqHbyuhyYgd6sei68AU266PyetDDAtjmYWF"
    let sign = try! Wallet.eosEcSign(handle: handle, path: BIP44.EOS_LEDGER, data: "imToken2017", isHex: false, publicKey: publicKey)
    txtResult.text = "sign： \n \(sign)"
    Log.d(sign)
  }
  
  @IBAction func addressBtnClick(_ sender: Any) {
    txtResult.text = ""
    let pubkey = try! Wallet.getEOSPubkey(handle: handle, path: BIP44.EOS_LEDGER)
    txtResult.text = "pubkey： \n \(pubkey)"
    Log.d(pubkey)
  }
  
  func appendResult(msg:String){
    DispatchQueue.main.async {
      self.txtResult.text += msg
      let bottom = NSMakeRange(self.txtResult.text.count - 1, 1)
      self.txtResult.scrollRangeToVisible(bottom)
    }
  }
}

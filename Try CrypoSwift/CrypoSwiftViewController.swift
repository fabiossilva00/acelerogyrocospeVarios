//
//  CrypoSwiftViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 03/05/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CryptoSwift

class CrypoSwiftViewController: UIViewController{
    
    var crypoV = String()
    var result = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textValor.delegate = self
        textValor.keyboardType = .numberPad

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textValor: UITextField!
    @IBOutlet weak var doButton: UIButton!
    @IBOutlet weak var valorLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var xxlabel: UILabel!
    @IBOutlet weak var xxButton: UIButton!
    @IBOutlet weak var voltarButton: UIButton!

    
//
//    func crypo(){
//
//        let valor = textValor.text!
//
////        let encrypto = try Blowfish(key: "secret", iv: "terces").encrypt(valor.bytes){ (variavel)
////        print(variavel)
////        }
//
//        let valorV = valor.bytes
//        print(valorV)
//        let key = "secret".bytes
//        let iv = "12345".bytes
////
//        let en = try? Blowfish(key: "secret", iv: "12345").encrypt(valorV)
//
//        print("En", en)
//
//        do {
//            let encry = try Blowfish(key: key, blockMode: .CFB(iv: iv), padding: .noPadding)
//            print(encry)
//        }catch{
//            print("Error!")
//        }
//
//        do {
//            let aes = try AES(key: "secret", iv: "terces")
//            let text = try aes.encrypt(Array("Teste".utf8))
//            print(text)
//        }catch {print("nope")}
//
//        do {
//            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap") // aes128
//            let ciphertext = try aes.encrypt(Array("Q".utf8))
//            let ida = ciphertext.toHexString()
//            print("Cupher", ida)
//            let volta = try aes.decrypt(Array(hex: "2ac1c5853622bdf0a01bb66bdfe8c59c"))
////            let volta = try ciphertext.decry"pt(cipher: aes)
//            let voltando = Data(volta)
//
//            print("Voltando", String(bytes: voltando, encoding: .utf8))
//        } catch {
//
//        print("cipher")
//
//        }
//
////        do {
////            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap")
////            let volta = try aes.decrypt(Array("29951512f09c87d81e4ce8640f7cf8e348d4120f3df1807cfee22eadea19bb66ecfaba40259ffb5a6aa1f724f92115a39bcb63c0f519faec5a4275415e962daf".utf8))
////            print("Volta", volta)
////        }catch {
////            print("Nao voltou")
////        }
//
////         crypoV = valor.sha256()
////
////        valorLabel.text = crypoV
//    }
//
   
    func cry() {
        let valor = textValor.text!
        let valorV = valor.utf8
        
        do {
            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap") // aes128
            let ciphertext = try aes.encrypt(Array(valorV))
            let ida = ciphertext.toHexString()
            
            valorLabel.text = ida

            crypoV = ida
            
            print(crypoV)
//
//            print("Cupher", ida)
//            let volta = try aes.decrypt(Array(hex: "2ac1c5853622bdf0a01bb66bdfe8c59c"))
//            //            let volta = try ciphertext.decry"pt(cipher: aes)
//            let voltando = Data(volta)
//
//            print("Voltando", String(bytes: voltando, encoding: .utf8))
        } catch {
            
            print("cipher")
            
        }
        
    }
    
    func descrypto(){

        do {
            
            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap")
            let volta = try aes.decrypt(Array(hex: crypoV))
            print(volta)
            let voltar = Data(volta)
            print(voltar)
            
            let da = String(bytes: voltar, encoding: .utf8)
            print(da)
            
            descripLabel.text = da
            
//            let da = String(
            
//            let voltando = Data(volta)
//            let dados = String(bytes: voltando, enconding: .utf8)
            
//            descripLabel.text = dados
//
//            print(String(bytes: voltando, encoding: .utf8)
//
//            descripLabel.text = String(bytes: voltando, enconding: .utf8)
            
        }catch{
            
        }

        
    }
    
    func stringX(){
        
        let cartao = textValor.text!
        
        var cartaoX = cartao
        
//        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
//
//        var valorRe = regex.stringByReplacingMatches(in: cartao, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, 8), withTemplate: "X")
        
//        let start = cartaoX.index(cartaoX.startIndex, offsetBy: 0)
//        let end = cartaoX.index(cartaoX.startIndex, offsetBy: 0 + 8)
//        let range: ClosedRange = 0...8
//        cartao.replacingCharacters(in: range, with: "X")
//        cartaoX.replaceSubrange(start..<end, with: "X")
        var i = 0
        
        for valorX in cartaoX {
            
            if i < 12{
                let tempo: Character = "X"
                result.append(tempo)
                i += 1
            }else{
                result.append(valorX)
                i += 1
            }

            
        }
        
//        print(valorRe)
        print(cartaoX)
        print(result)
        xxlabel.text = result
    }


    @IBAction func crypto(_ sender: Any) {
        cry()
    }
    
    @IBAction func decrypto(_ sender: Any) {
        descrypto()
        
    }
    
    @IBAction func xxButton(_ sender: Any) {
        result = ""
        stringX()
        
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CrypoSwiftViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
}

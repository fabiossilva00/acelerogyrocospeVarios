//
//  CamposRegExViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 31/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class CamposRegExViewController: UIViewController {
    
    @IBOutlet weak var cartaoText: UITextField!
    @IBOutlet weak var dataText: UITextField!
    @IBOutlet weak var cvvText: UITextField!
    
//    func validarData(string: String) -> Bool {
//        //        let regex = try! NSRegularExpression(pattern: "^(20)\\d\\d[/](0[1-9]|1[012])$")
//        let regex = try! NSRegularExpression(pattern: "^(0[1-9]|1[012][/]((20)\\d\\d))$")
//
//        return regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.characters.count)) != nil
//    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard let text = textField.text else { return true }
//        let newLength = text.count + string.count - range.length
//        let characterSet = CharacterSet(charactersIn: string)
//
//        if text.characters.count == 2, !string.characters.isEmpty {
//            textField.text = text + "/"
//        }
//
//        return CharacterSet.decimalDigits.isSuperset(of: characterSet) && newLength <= 7
//    }
    
//    @objc func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let text = textField.text else { return }
//        let isUserInputValid = validarData(string: text)
//
//        if !isUserInputValid {
//            print (text)//TODO: Notify user that expiration date is invalid
//        }
//    }
    
    
    @IBAction func testeRegButton(_ sender: Any) {
        let dataT = dataText.text!
        let dataReg = dataRegEx(dataT)
        print(dataReg)
        print(dataT)
    }
    
    
    
    func dataRegEx(_ data: String) -> Bool {
//        let regEx = "^(20)\\d\\d[/](0[1-9]|1[012])$"
        let regEx = "^(0[1-9]|1[012][/]((20)\\d\\d))$"
        let dataregEx = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        
        return dataregEx.evaluate(with: data)
    }
    
    @objc func textFieldRegEx(_ textField: UITextField) {
        guard let text = textField.text else {return}
        let valida = dataRegEx(text)
        if valida != true {
            print("Data invalida")
        }
    }
    
    @IBAction func testeData(_ sender: UITextField) {

    }
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataText.addTarget(self, action: #selector(textFieldRegEx), for: .editingChanged)
        
        
        
        // Do any additional setup after loading the view.
    }

    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

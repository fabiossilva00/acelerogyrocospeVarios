//
//  AlamoTestes2ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 23/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AlamoTestes2ViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var senhaTxt: UITextField!
    @IBOutlet weak var apelidoLbl: UILabel!
    @IBOutlet weak var numeroLbl: UILabel!
    @IBOutlet weak var saldoLbl: UILabel!
    @IBOutlet weak var numeroText: UITextField!
    
    @IBAction func regexText(_ sender: UITextField) {
        let nome = nomeReg(sender.text!)
        print(nome)
    }
    
    func nomeReg(_ nome:String) -> Bool {
        let nomeRegEx = "^([a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]{2,}\\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}\\s?([a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð]{1,})?)"
        let nomeTest = NSPredicate(format: "SELF MATCHES[c] %@", nomeRegEx)
        
        return nomeTest.evaluate(with: nome)
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        AlamoTeste().loginCampos(email: emailTxt.text!, senha: senhaTxt.text!,
            sucess: { (sucess) in
//                let json = sucess as! NSDictionary
//                let apelido = json.value(forKey: "apelido") as! String
//                let numero = json.value(forKey: "numero_cartao") as! String
//                let saldo = json.value(forKey: "user_saldo") as! String
//
//                self.apelidoLbl.text = apelido
//                self.numeroLbl.text = numero
//                self.saldoLbl.text = saldo
//                self.numeroText.text = numero
                print(sucess.apelido)
                print(sucess.numero)
                print(sucess.saldo)
        },
            
            failure: { (failure) in
                print(failure)
        })
    
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyBoard")
        view.addGestureRecognizer(tap)
        
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

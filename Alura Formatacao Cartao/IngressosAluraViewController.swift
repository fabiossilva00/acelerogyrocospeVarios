//
//  IngressosAluraViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 11/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CPF_CNPJ_Validator
import Alamofire

enum textCampos: Int {
    
    case nome = 1
    case email = 2
    case cpf = 3
    case cep = 4
    case endereco = 5
    case bairro = 6
    case numero = 7
    case mes = 8
    case ano = 9
    case codseg = 10
    case parcelas = 11
    
}

class IngressosAluraViewController: UIViewController {
    
    var urlCEP = String()
    
    @IBOutlet weak var scrollIngressos: UIScrollView!
    @IBOutlet weak var aluraImage: UIImageView!
    @IBOutlet weak var ingressoImage: UIImageView!
    @IBOutlet weak var cartaoImage: UIImageView!
    
    @IBOutlet var camposText: [UITextField]!
    
    @IBAction func comprarButton(_ sender: Any) {
        let camposVerificar = textVer(camposText: camposText)
        let campoCPF = cpfV(camposText: camposText)
        if camposVerificar && campoCPF {
            print("true")
        }else{
            print("false")
            present(notificaText(), animated: true, completion: nil)
        }
    }
    
    @IBAction func cepAPI(_ sender: UITextField) {
        
        AlamoAPI().alamoAPI(cep: sender.text! , sucess: { (localizacao) in
            self.cepCampos(textCampo: .endereco, completion: { (enderecoText) in
                enderecoText.text = localizacao.logradouro
            })
            self.cepCampos(textCampo: .bairro, completion: { (bairroText) in
                bairroText.text = localizacao.bairro
            })
        },
            failure: {(error) in print(error)})
    }
    
    @IBAction func codSegText(_ sender: UITextField) {
        
        u
        
    }
    
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    func textVer(camposText: Array<UITextField>) -> Bool{
        var textCampos = true
        
        for campoText in camposText{
            if campoText.text  == "" {
                textCampos = false
            }else{
                textCampos = true
            }
        }
        return textCampos
    }
    
    func cpfV(camposText: Array<UITextField>) -> Bool {
        var textDict: Dictionary<textCampos, UITextField> = [:]
        
        for textField in camposText{
            if let textCampo = textCampos(rawValue: textField.tag){
                textDict[textCampo] = textField
            }
        }
        
        guard let cpf = textDict[.cpf], BooleanValidator().validate(cpf: cpf.text!) else {return false}
        guard let email = textDict[.email], self.emailV(email.text!) else {return false}
        
        return true
    }
    
    func cepCampos(textCampo: textCampos, completion:(_ textCEP: UITextField) -> Void){
        
        for textField in camposText{
            if let textFieldCEP = textCampos(rawValue: textField.tag){
                if textFieldCEP == textCampo{
                    completion(textField)
                }
            }
        }
    }
    
    func emailV(_ email:String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
        
    }
    
    func notificaText() -> UIAlertController {
        
        let notifica = UIAlertController(title: "Campos", message: "Vazios", preferredStyle: .alert)
        let button = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        notifica.addAction(button)
        return notifica
    }
    
    func atuaTela(){
        aluraImage.image = UIImage(named: "logo_alura.png")
        ingressoImage.image = UIImage(named: "banner.png")
        cartaoImage.image = UIImage(named: "bandeiras_cartoes")
        ingressoImage.layer.cornerRadius = 6
        ingressoImage.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atuaTela()
        // Do any additional setup after loading the view.
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

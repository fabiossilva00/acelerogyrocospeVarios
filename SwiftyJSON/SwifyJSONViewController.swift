//
//  SwifyJSONViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 29/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import AKMaskField
import CreditCardValidator

class SwifyJSONViewController: UIViewController, AKMaskFieldDelegate {
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var variosLbl: UILabel!
    @IBOutlet weak var cartaoText: UITextField!
    
    let alamoSwift = AlamoSwiftyJSON()
    
    var mutable = NSMutableAttributedString()
    
    var bancos: Array<String> = ["Bradesco", "Itaú", "Caixa", "Brasil", "Santander"]
    let texto3 = ""
    
    
    
    @IBAction func Button1(_ sender: Any) {
        if Button1 == sender as? UIButton{
            if Button1.isSelected{
                Button1.isSelected = false
                
            }else{
                Button1.isSelected = true
                if Button2.isSelected == true ||  Button3.isSelected == true {
                    Button2.isSelected = false
                    Button3.isSelected = false
                }
//                AlamoSwiftyJSON
            }
        }
        
        alamoSwift.loginAPI(email: "teste05@teste.com", senha: "123456", sucess: { (sucess) in
            print(sucess)
        }, failure: { (failure) in
            print(failure)
        })
        
    }
    
    @IBAction func Button2(_ sender: Any) {
        if Button2 == sender as? UIButton{
            if Button2.isSelected{
                Button2.isSelected = false
                
            }else{
                Button2.isSelected = true
                if Button1.isSelected == true ||  Button3.isSelected == true {
                    Button1.isSelected = false
                    Button3.isSelected = false
                }
            }
        }
    }
    
    @IBAction func Button3(_ sender: Any) {
        if Button3 == sender as? UIButton{
            if Button3.isSelected{
                Button3.isSelected = false
                
            }else{
                Button3.isSelected = true
                if Button2.isSelected == true ||  Button1.isSelected == true {
                    Button2.isSelected = false
                    Button1.isSelected = false
                }
            }
        }
    }
    
    @IBAction func mudaButton(_ sender: Any) {
        
        variosLbl.text = ""
        let texto1 = "Atencao! Abra o aplicativo ou acesse o site do banco \(bancos[0]) e transfira o valor abaixo para a conta do Consutaí"
        variosLbl.text = texto1
        variosLbl.numberOfLines = 3
        variosLbl.minimumScaleFactor = 0.65
        variosLbl.textAlignment = .center
        variosLbl.adjustsFontSizeToFitWidth = true
        
    }
    
    @IBAction func muda2Button(_ sender: Any) {
        
        let texto1 = "Atencao! Abra o aplicativo ou acesse o site do banco \(bancos[0]) e transfira o valor abaixo para a conta do Consutaí"
//        mutable = NSMutableString(string: texto1)

        variosLbl.text = ""
        variosLbl.numberOfLines = 3
        variosLbl.minimumScaleFactor = 0.65
        variosLbl.textAlignment = .center
        variosLbl.adjustsFontSizeToFitWidth = true
        
        mutable = NSMutableAttributedString(string: texto1, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)])
        mutable.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 8))
        variosLbl.attributedText = mutable
        
    }
    
    @IBAction func muda3Button(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func touchUpOutside(_ sender: UITextField) {
        
        let numero = cartaoText.text!
        print(numero)
        let ello = self.eloV(cartaoText.text!)
        print(ello)
        
    }
    
    
    @IBAction func cartaoText(_ sender: UITextField) {
        
        if let type = CreditCardValidator().type(from: sender.text!){
            print(type.name)
        }
        let numero = cartaoText.text!
        print(numero)
    print(sender.text!)
        
    }
    
    @IBAction func cartaoVButton(_ sender: Any) {
        let numero = cartaoText.text!
        print(numero)
            let ello = self.eloV(cartaoText.text!)
        print(ello)
    }
    
    func eloV(_ elo: String) -> Bool{
        let eloRegEx = "^((((636368)|(438935)|(504175)|(451416)|(636297))[0-9]{0,10})|((5067)|(4576)|(4011))[0-9]{0,12})$"
        let eelo = NSPredicate(format: "SELF MATCHES[c] %@", eloRegEx)
        return eelo.evaluate(with: elo)
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cartaoText.maskDelegate = self
//        cartaoText.maskExpression = "{dddd} {dddd} {dddd} {dddd}"
//        cartaoText.maskTemplate = " "
        
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

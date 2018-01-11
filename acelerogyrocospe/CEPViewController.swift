//
//  CEPViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 10/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

class CEPViewController: UIViewController {
    
    @IBOutlet weak var cepText: UITextField!
    @IBOutlet weak var logradouroLabel: UILabel!
    @IBOutlet weak var numeroText: UITextField!
    @IBOutlet weak var bairroLabel: UILabel!
    @IBOutlet weak var cidadeLabel: UILabel!
    @IBOutlet weak var estadoLabel: UILabel!
    @IBOutlet weak var ibgeLabel: UILabel!
    @IBOutlet weak var complementoText: UITextField!
    
    var urlCEP = String()
    
//    https://viacep.com.br/ws/cepURL/json/
    
    func alamoCEP() {
        
        
        urlCEP = "https://viacep.com.br/ws/\(String(describing: cepText.text!))/json/"
        print(urlCEP)
        
        Alamofire.request(urlCEP, encoding: JSONEncoding.default).validate().responseJSON{ response in
            switch response.result{
            case .success:
                    if let resposta = response.result.value{
                        let json = resposta as! NSDictionary
//                        print(json)
                        guard let logradouro = json.value(forKey: "logradouro") else {return}
                        self.logradouroLabel.text = String(describing: logradouro)
        
                        guard let bairro = json.value(forKey: "bairro") else {return}
                        self.bairroLabel.text = String(describing: bairro)

                        guard let cidade = json.value(forKey: "localidade") else {return}
                        self.cidadeLabel.text = String(describing: cidade)

                        guard let uf = json.value(forKey: "uf") else {return}
                        self.estadoLabel.text = String(describing: uf)

                        guard let ibge = json.value(forKey: "ibge") else {return}
                        self.ibgeLabel.text = String(describing: ibge)
//
                    }
                break
            case .failure:
                    print(response)
                break
            }
        }
    }
    
    @IBAction func cepText(_ sender: UITextField) {
        guard var numeroCEP = cepText.text else {return}
        if numeroCEP.count >= 8{
            cepText.text = String(numeroCEP.prefix(8))
        }else{
            cepText.text = numeroCEP
        }
    }
    
    @IBAction func buscaCEPButton(_ sender: Any) {
        alamoCEP()
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cepText.delegate = self

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
extension CEPViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        alamoCEP()
        cepText.resignFirstResponder()
        return true
    }

}

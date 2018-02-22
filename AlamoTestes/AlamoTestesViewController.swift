//
//  AlamoTestesViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 23/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

class AlamoTestesViewController: UIViewController {
    
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var saldoLbl: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        AlamoTeste().login(sucess: { (sucess)  in
            print(sucess)
//            let dados = sucess as! NSDictionary
//            let numero = dados.value(forKey: "numero_cartao") as! String
//            self.loginLbl.text = numero
            
        }, failure: { (error) in
            print(error)
            self.alertErr()
            
        })
    }
    
    @IBAction func saldoButton(_ sender: Any) {
        
        
    }
    
    
    @IBAction func voltarButton(_ sender: Any) {
     
        dismiss(animated: true, completion: nil)
        
    }
    
    func alertErr(){
        let alertController = UIAlertController(title: "Conexao", message: "Erro", preferredStyle: .alert)
        let alertDentro = UIAlertController(title: "Burro", message: "Errou!", preferredStyle: .alert)
        
        let okActionB = UIAlertAction(title: "Error", style: .destructive, handler: nil)
        alertDentro.addAction(okActionB)
        
        let okActionP = UIAlertAction(title: "OKay", style: .default, handler: { _ in
            self.present(alertDentro, animated: true, completion: nil)

        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okActionP)
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

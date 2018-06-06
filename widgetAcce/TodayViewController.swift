//
//  TodayViewController.swift
//  widgetAcce
//
//  Created by Fabio Sousa da Silva on 24/05/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var teste1Label: UILabel!
    @IBOutlet weak var teste2Label: UILabel!
    
    let shareDefaults = UserDefaults.init(suiteName: "group.acelerogyrocospeShare")
    
    @IBAction func todayButton(_ sender: Any) {
        
        teste1Label.text = "Atualizando..."
        API.getLogin(success: { (success) in
            print(success)
            
            self.teste2Label.text = "R$ \(success)"
            self.teste1Label.text = "Seu saldo é de:"
        }, failure: { (failure) in
            print(failure)
        })
        
    }
    
    func verificaDados(){
        
//        guard let nome = try? shareDefaults?.value(forKey: "nome") else { throw
//            do {
//                self.teste1Label.text = "Sem user logado"
//            }catch{
//                self.teste1Label.text = "Erro ao realizar a atualizacao"
//            }
//        }
            guard let email = shareDefaults?.value(forKey: "email") as? String else { return }
            guard let senha = shareDefaults?.value(forKey: "senha") as? String else { return }
            guard let saldo = shareDefaults?.value(forKey: "saldo") as? String else { return }
        
            print(email)
            print(senha)
            print(saldo)
        
            if email.isEmpty || senha.isEmpty {
                self.teste1Label.text = "Faca login para verificar o saldo"
            }else{
                if saldo.isEmpty{
                    self.teste1Label.text = "Atualize para o verificar o saldo"
                }else{
                    self.teste2Label.text = "R$ \(String(describing: saldo))"
                }
            }
            
//            if let _ = shareDefaults?.value(forKey: "nome") , let _ = shareDefaults?.value(forKey: "senha") {
//                if let saldo = shareDefaults?.value(forKey: "saldo"){
//                    self.teste2Label.text = "R$ \(String(describing: saldo))"
//                }else{
//                    self.teste1Label.text = "Faca login para verificar o saldo"
//                }
//            }else{
//                self.teste1Label.text = "Faca login para verificar o saldo"
//            }
            
//            if (nome as! String).isEmpty || (senha as! String).isEmpty{
//                self.teste1Label.text = "Sem usuario logado"
//            }else {
//                if !(saldo as! String).isEmpty {
//                    self.teste2Label.text = "R$ \(String(describing: saldo))"
//                }else{
//                    self.teste1Label.text = "Faca login para verificar o saldo"
//                }
//            }
//            API.getLogin(success: { (success) in
//                self.teste2Label.text = "R$ \(success)"
//                self.teste1Label.text = "Seu saldo é de: "
//
//            }, failure: { (failure) in
//                self.teste1Label.text = "Erro em atualiza o saldo"
//            })
            
        
//            self.teste1Label.text = "Sem user logado"
//        guard let senha = shareDefaults?.value(forKey: "senha") else { throw
//            self.teste1Label.text = "User deslogado"
//        }
//
        
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        verificaDados()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        verificaDados()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        verificaDados()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}

//
//  TodayValoresViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 24/05/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class TodayValoresViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var senhaText: UITextField!
    
    let sharedDefault = UserDefaults(suiteName: "group.acelerogyrocospeShare")
    
    @IBAction func dadosButton(_ sender: Any) {
        
        dadosTexts()
    }
    
    func dadosTexts(){
        
        if let email = emailText.text, let senha = senhaText.text {
            
            emailLabel.text = email
            senhaLabel.text = senha
            
            sharedDefault?.set(email, forKey: "email")
            sharedDefault?.set(senha, forKey: "senha")
            
        }
        
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

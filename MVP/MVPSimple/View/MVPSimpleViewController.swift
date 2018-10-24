//
//  MVPSimpleViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 29/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

class MVPSimpleViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var senhaText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
//    var presenter: LoginPresenter?
    
    @IBAction func entrarButton(_ sender: Any) {
        
        if let email = emailText.text, let senha = senhaText.text {
            let login = Login(email: email, senha: senha)
            
//            presenter?.entrarButton(parameters: login)
//            LoginPresenterImplementation().entrarButton(parameters: login)
            pokeManager()
            
        }
        
    }
    
    func pokeManager() {
        guard let urlRequest = URL(string: "http://pokeapi.co/api/v2/") else { return }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        let sessionManager = SessionManager.default
        sessionManager.request(urlRequest, method: .get).responseJSON() { response in
            print(response)
            
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

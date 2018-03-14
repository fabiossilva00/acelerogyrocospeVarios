//
//  MessageSwiftPodViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 09/03/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import SwiftMessages

class MessageSwiftPodViewController: UIViewController {
    
    func mudaTelaXib() {
        
        let outraMessageID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "outraMessageID")
        self.present(outraMessageID, animated: true, completion: nil)
        
    }
    

    @IBAction func messageXibButton(_ sender: Any) {
        
        let viewMessage : viewMessagePodView = try! SwiftMessages.viewFromNib()
        viewMessage.entendi = {
            self.mudaTelaXib()
            SwiftMessages.hide()
            
        }
        
        viewMessage.cancel = {
            SwiftMessages.hide()
            
        }
        
//        let message = MessageView.viewFromNib(layout: .messageView)
//        let message: MessagepodView = try! SwiftMessages.viewFromNib()
//        let message: MessageView = try! SwiftMessages.viewFromNib(named: "viewMessagePodView")

        var config = SwiftMessages.Config()
        config.presentationStyle = .bottom
        config.duration = .seconds(seconds: 15)
        
        SwiftMessages.show(config: config, view: viewMessage)
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
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

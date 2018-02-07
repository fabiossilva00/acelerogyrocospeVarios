//
//  CallChildViewViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 07/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class CallChildViewViewController: UIViewController {
    
    @IBOutlet weak var mostraView: UIView!
    
    @IBAction func backButton(_ sender: Any) {
        let adaptavelEscondidoID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "adaptavelEscondidoID")
        
        addChildViewController(adaptavelEscondidoID)
        adaptavelEscondidoID.view.frame = mostraView.bounds
        mostraView.addSubview(adaptavelEscondidoID.view)

        
    }
    
    @IBAction func goButton(_ sender: Any) {
        
        var viewControllers : [UIViewController]!
        
        let controller = UIStoryboard(name: "Main", bundle: nil)
        
        let autoAdaptavelID = controller.instantiateViewController(withIdentifier: "autoAdaptavelID")
        
        let adaptavelEscondidoID = controller.instantiateViewController(withIdentifier: "adaptavelEscondidoID")
        
        let ingressosID = controller.instantiateViewController(withIdentifier: "ingressosID")
        
        viewControllers = [autoAdaptavelID, autoAdaptavelID, ingressosID]
        
        addChildViewController(viewControllers[0])
        viewControllers[0].view.frame = mostraView.bounds
        mostraView.addSubview(viewControllers[0].view)
        
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        
        let buttonTelasID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

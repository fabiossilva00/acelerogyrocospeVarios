//
//  AdptavelEscondidoViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 07/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AdptavelEscondidoViewController: UIViewController {
    
    @IBAction func voltaButton(_ sender: Any) {
        
        let buttonTelasID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
        
    }
    
    @IBAction func adaptavelButton(_ sender: Any) {
        
        let autoAdaptavelID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "autoAdaptavelID")
        self.present(autoAdaptavelID, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismiss")
//        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismiss() {
        view.endEditing(true)
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

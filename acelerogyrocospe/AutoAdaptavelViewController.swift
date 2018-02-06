//
//  AutoAdaptavelViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 06/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AutoAdaptavelViewController: UIViewController {
    
    
    @IBOutlet weak var viewButton: UIView!
    
    
    @IBAction func voltarButton(_ sender: Any) {
        let buttonTelasID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewButton.layer.cornerRadius =  tamanhoTelaCorner()
        viewButton.layer.masksToBounds = true
        
    
//        let model = UIDevice.current.modelName
//        switch model {
//        case "iPhone SE":
//            viewButton.layer.cornerRadius = 15
//            break
//        case "iPhone 6s", "iPhone 6":
//            viewButton.layer.cornerRadius = 24
//            break
//        case "Simulator":
//            viewButton.layer.cornerRadius = 30
//            break
//        default: break
//        }
        

        // Do any additional setup after loading the view.
    }
    
    let screen = UIScreen.main.bounds
    
    func tamanhoTelaCorner() -> CGFloat {
        
        let screeWidth = screen.width

        switch(screeWidth) {

        case 375:
            return 100

        case 414:
            return 32

        case 320:
            return 77

        default:
            return 77
        }
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

//
//  TransicaoBaixoViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 21/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//https://medium.com/ios-os-x-development/uiview-animation-in-swift-3-2b499abb58c5


import UIKit

class TransicaoBaixoViewController: UIViewController {

    @IBOutlet weak var viewTransicao: UIView!
    
    func viewSome() {
        
        UIView.animate(withDuration: 2.5, animations: {
            self.viewTransicao.isHidden = false
            self.viewTransicao.frame.origin.y -= self.viewTransicao.frame.height
        }, completion: nil)
        
        UIView.animate(withDuration: 2.5, delay: 5, animations: {
            self.viewTransicao.frame.origin.y += self.viewTransicao.frame.height
        }, completion: nil)
        
    }
    
    @IBAction func animaButton(_ sender: Any) {
        viewSome()
        
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        
        let buttonTelasID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTransicao.isHidden = true

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

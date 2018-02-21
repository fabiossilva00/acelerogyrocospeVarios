//
//  TransicaoBaixoViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 21/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//
//https://medium.com/ios-os-x-development/uiview-animation-in-swift-3-2b499abb58c5
//https://www.raywenderlich.com/76200/basic-uiview-animation-swift-tutorial
//

import UIKit

class TransicaoBaixoViewController: UIViewController {

    @IBOutlet weak var viewTransicao: UIView!
    @IBOutlet weak var algumaLabel: UILabel!
    @IBOutlet weak var imageAranha: UIImageView!
    @IBOutlet weak var viewTeia: UIView!
    @IBOutlet weak var animaButton: UIButton!
    
    let screen = UIScreen.main.bounds
    
    func viewSome() {
        
        let yScreen = screen.width
        let xScreen = screen.height
        
        UIView.animate(withDuration: 2.5, animations: {
            self.animaButton.isEnabled = false
            self.viewTransicao.isHidden = false
            self.viewTransicao.frame.origin.y -= self.viewTransicao.frame.height
        }) { _ in
            UIView.animate(withDuration: 2.5, delay: 2.5, animations: {
                self.viewTransicao.frame.origin.y += self.viewTransicao.frame.height
            }) { _ in
                UIView.animate(withDuration: 4.5, delay: 0.7, options: .allowUserInteraction, animations: {
                    self.imageAranha.isHidden = false
                    self.viewTeia.isHidden = false
                    self.imageAranha.frame.origin.y += yScreen
                    self.viewTeia.frame.origin.y += yScreen
                    
                }) { _ in
                    UIView.animate(withDuration: 1.5, delay: 0.0, options: .allowUserInteraction, animations: {
                        self.imageAranha.frame.origin.y += 65
                        self.imageAranha.frame.origin.x -= 65
                        
                    }) { _ in
                        UIView.animate(withDuration: 2.0, delay: 0.0, options: .allowUserInteraction, animations: {
                            self.imageAranha.frame.origin.x += xScreen
                            
                        })
                    }
                }
            }
        }
        
    }
    
    @objc func mudaTela() {
        let buttonTelasID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
        
    }
    
    @IBAction func animaButton(_ sender: Any) {
        viewSome()
        
    }
    
    @IBAction func voltarButton(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTransicao.isHidden = true
        imageAranha.isHidden = true
        viewTeia.isHidden = true
        self.imageAranha.isUserInteractionEnabled = true

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAranha))
        imageAranha.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tapAranha() {
    
        let alertController = UIAlertController(title: "Ai!", message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tchau!", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
        
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

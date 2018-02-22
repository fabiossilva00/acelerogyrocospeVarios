//
//  Transition2ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 15/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Transition2ViewController: UIViewController {

    @IBOutlet weak var imageTap: UIImageView!
    @IBOutlet weak var viewTap: UIView!
    
    @objc func tapView() {
        let buttonTelasID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
        removeFromParentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageTap.image = UIImage(named: "ic_como_funciona.png")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
        self.viewTap.addGestureRecognizer(tap)
        
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

//
//  IngressosAluraViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 11/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class IngressosAluraViewController: UIViewController {
    
    @IBOutlet weak var scrollIngressos: UIScrollView!
    @IBOutlet weak var aluraImage: UIImageView!
    @IBOutlet weak var ingressoImage: UIImageView!
    @IBOutlet weak var cartaoImage: UIImageView!
    
    @IBOutlet var camposText: [UITextField]!
    
    func textVer(){
        camposText.count
            
        
    }
    
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    func atuaTela(){
        aluraImage.image = UIImage(named: "logo_alura.png")
        ingressoImage.image = UIImage(named: "banner.png")
        cartaoImage.image = UIImage(named: "bandeiras_cartoes")
        ingressoImage.layer.cornerRadius = 6
        ingressoImage.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atuaTela()
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

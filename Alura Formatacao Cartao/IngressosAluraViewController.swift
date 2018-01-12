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
    
    @IBAction func comprarButton(_ sender: Any) {
        let camposVerificar = textVer(camposText: camposText)
        
        if camposVerificar {
            print("true")
        }else{
            print("false")
            present(notificaText(), animated: true, completion: nil)
        }
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    func textVer(camposText: Array<UITextField>) -> Bool{
        var textCampos = true
        
        for campoText in camposText{
            if campoText.text  == "" {
                textCampos = false
            }else{
                textCampos = true
            }
        }
        return textCampos
    }
    
    func notificaText() -> UIAlertController {
        
        let notifica = UIAlertController(title: "Campos", message: "Vazios", preferredStyle: .alert)
        let button = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        notifica.addAction(button)
        return notifica
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
        
//        let tap: UIGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(IngressosAluraViewController.dismissed))
//        view.addGestureRecognizer(tap)
        
        atuaTela()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissed() {
        
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

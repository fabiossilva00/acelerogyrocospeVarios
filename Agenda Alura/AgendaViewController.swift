//
//  AgendaViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 22/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController {
    
    @IBOutlet weak var imageFoto: UIImageView!
    @IBOutlet weak var fotoBUtton: UIButton!
    @IBOutlet weak var nomeText: UITextField!
    @IBOutlet weak var enderecoText: UITextField!
    @IBOutlet weak var telefoneText: UITextField!
    @IBOutlet weak var siteText: UITextField!
    @IBOutlet weak var imageStars: UIImageView!
    @IBOutlet weak var stepperAgenda: UIStepper!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    func atualizaTela() {
        
        imageFoto.layer.borderWidth = 1.5
        imageFoto.layer.borderColor = UIColor.lightGray.cgColor
        imageFoto.layer.cornerRadius = self.imageFoto.frame.height / 2
//        imageFoto.layer.cornerRadius = self.imageFoto.frame.width / 2
        
    }
    
    @objc func scrollPlus(_ notification: Notification) {
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + self.scrollView.frame.height / 2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {	
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atualizaTela()
        
        NotificationCenter.default.addObserver(self, selector: #selector (scrollPlus(_:)), name: .UIKeyboardDidShow, object: nil)

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

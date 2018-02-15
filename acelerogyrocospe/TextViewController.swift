//
//  TextViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 15/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import InputMask

class TextViewController: UIViewController {
    
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!

    @IBOutlet weak var textField4: UITextField!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == textField1{
//            textField2.becomeFirstResponder()
//        }else{
//            textField1.resignFirstResponder()
//        }
        switch textField.tag{
        case 1:
            textField2.becomeFirstResponder()
            break
        case 2:
            textField3.becomeFirstResponder()
            break
        case 3:
            textField4.becomeFirstResponder()
            break
        case 4:
            textField4.resignFirstResponder()
            break
        default: break
        }
        return true
    }

    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyBoard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyBoard(){
        view.endEditing(true)
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

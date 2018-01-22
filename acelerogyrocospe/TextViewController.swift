//
//  TextViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 15/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import AKMaskField

class TextViewController: UIViewController, AKMaskFieldDelegate {
    
    
    @IBOutlet weak var textField1: AKMaskField!
    
    @IBOutlet weak var textField2: AKMaskField!
    
    @IBOutlet weak var textField3: AKMaskField!

    @IBOutlet weak var textField4: AKMaskField!
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        if textField == textField1{
////            textField2.becomeFirstResponder()
////        }else{
////            textField1.resignFirstResponder()
////        }
//        switch textField.tag{
//        case 1:
//            textField2.becomeFirstResponder()
//            break
//        case 2:
//            textField3.becomeFirstResponder()
//            break
//        case 3:
//            textField4.becomeFirstResponder()
//            break
//        case 4:
//            textField4.resignFirstResponder()
//            break
//        default: break
//        }
//        return true
//    }
    
    func maskFieldShouldReturn(_ maskField: AKMaskField) -> Bool {
        switch maskField.tag{
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
    
    func maskFieldDidBeginEditing(_ maskField: AKMaskField) {
        switch maskField.tag {
        case 1:
            print("Text1B")
            break
        case 2:
            print("Text2B")
            break
        case 3:
            print("Text3B")
            break
        default: break
        }
    }
    
    func maskFieldDidEndEditing(_ maskField: AKMaskField) {
        switch maskField.tag {
        case 1:
            print("Text1E")
            break
        case 2:
            print("Text2E")
            break
        case 3:
            print("Text3E")
            break
        default: break
        }
    }

    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.maskDelegate = self
        textField2.maskDelegate = self
        textField3.maskDelegate = self
        textField4.maskDelegate = self
        
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

//
//  SplashTesteViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 06/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class SplashTesteViewController: UIViewController {
    
    @IBOutlet weak var imageNuvem: UIImageView!
    
    
    func del(){
        delay(3.5){
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func ChangeImage(){
        
        del()
        imageNuvem.animationDuration = 15.0
        
        let imagensNuvens = [UIImage(named:"FRAME_1"), UIImage(named:"FRAME_2"), UIImage(named: "FRAME_3"), UIImage(named: "FRAME_4")]
        let animated = UIImage.animatedImage(with: imagensNuvens as! [UIImage], duration: 2.0)
        imageNuvem.image = animated
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ChangeImage()
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

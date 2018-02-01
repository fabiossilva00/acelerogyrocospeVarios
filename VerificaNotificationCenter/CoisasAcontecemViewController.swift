//
//  CoisasAcontecemViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 01/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class CoisasAcontecemViewController: UIViewController {
    
    let faceUp = UIDeviceOrientation.faceUp
    let faceDown = UIDeviceOrientation.faceDown
    let portrait = UIDeviceOrientation.portrait
    let upSidedown = UIDeviceOrientation.portraitUpsideDown
    let landR = UIDeviceOrientation.landscapeRight
    let landL = UIDeviceOrientation.landscapeLeft
    
    @IBOutlet weak var coisasLabel: UILabel!
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func luz() {
        coisasLabel.text = "Luz!"
    }
        
    @objc func posicao() {
        coisasLabel.text = "Posicao"
    }
    
    @objc func SS() {
        coisasLabel.text = "Tirou Print da Tela"
    }
    
    @objc func bateriaC() {
        coisasLabel.text = "Take my energy"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(luz), name: .UIScreenBrightnessDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(posicao), name: .UIDeviceOrientationDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SS), name: .UIApplicationUserDidTakeScreenshot, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(bateriaC), name: .UIDeviceBatteryStateDidChange, object: nil)

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

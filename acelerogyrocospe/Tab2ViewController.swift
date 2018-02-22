//
//  Tab2ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 16/11/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Tab2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBntVolta.layer.cornerRadius = 23

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var viewBntVolta: UIView!
    
    @IBAction func voltarButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

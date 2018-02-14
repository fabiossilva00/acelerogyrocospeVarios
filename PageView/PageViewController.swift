//
//  PageViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 14/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var pageIndex: Int = 0
    var nameImage = String()
    
    @IBOutlet weak var imagePage: UIImageView!
    
    @IBAction func voltaButton(_ sender: Any) {
        
        let buttonTelasID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePage.image = UIImage(named: nameImage)

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

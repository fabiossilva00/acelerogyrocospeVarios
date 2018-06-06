//
//  saldoAPIViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 05/06/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class saldoAPIViewController: UIViewController {
    
    let saldoGet = saldoBilheteAPI()
    let bilbo = AlamoTeste()
    
    @IBAction func getButton(_ sender: Any) {
     
//        saldoGet.getSaldo()
//        bilbo.alamoTrust()
        bilbo.managerTeste()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

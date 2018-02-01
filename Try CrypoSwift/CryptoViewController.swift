//
//  CryptoViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 22/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CryptoSwift
import Alamofire


class CryptoViewController: UIViewController {
    
    let data = Data(bytes: [0x01, 0x02, 0x03])
    func hashed() {
//        let hash = data.sha256()
//        print(hash)
//
//        let teste1 = "Teste1"
//        let teste2 = "Teste2"
//        let teste3 = "Teste3"
//        let con256 = teste1.sha256()
//        print(con256)
//        let testado = "e45c5148efd538b29e3fcb930d689814c002c1c9267a89317aff35003c759a6c"
//        let rev256 = testado.crc32()
//        print(rev256)
//
////        let crc1 = (teste1.crc16()).utf8
//        let crc1 = teste1.crc16()
//        print(crc1)
//        let crc2 = teste2.crc16()
//        let crc3 = teste3.crc16()
////
//        let arrayCR: Array<String> = [crc1, crc2, crc3]
//        print(arrayCR)
        
        
////
//        let des = crc3.crc16(seed: default)
//        print(des)
        
//        let parameters: Parameters=["campo1": "1", "campo2" : ["2": "2"]]
//        Alamofire.request(data as! URLRequestConvertible)
//        Alamofire.DataRequest(URL)
        
//        let cep = CEPViewController()
//        let url = cep.urlCEP
        
    }
    
    
    @IBAction func voltarButton(_ sender: Any) {
     
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hashed()

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

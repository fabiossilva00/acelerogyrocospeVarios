//
//  InternetTestesViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 06/07/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class InternetTestesViewController: UIViewController {

    @IBOutlet weak var internetLabel: UILabel!
    
    @IBAction func voltarButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func testeButton(_ sender: Any) {
        let ultimaRecarga = "ultima recarga: R$10,00 data: 05/07/2018 15:17:45"
//        let predicateRecarga = NSPredicate(format: "SELF CONTAINS %@", "ultima recarga").evaluate(with: ultimaRecarga)
//        let predicateData = NSPredicate(format: "SELF CONTAINS %@", "data")
//        ultimaRecarga.
//        print(predicateRecarga)
//        print(predicateData)
        let recargaSplit = ultimaRecarga.split(separator: " ")
        print(recargaSplit)
        print(recargaSplit[2], recargaSplit[4], recargaSplit[5])
        let recargaComponents = ultimaRecarga.components(separatedBy: " ")
        print(recargaComponents)
        
    }
    
    func testeValor( success: @escaping (_ success: Any) -> Void){
        
        success("Teste")
        
    }
    
    func verificaInternet() {
        
        guard let status = Network.reachability?.status else { return }
        switch status {
        case .unreachable:
            view.backgroundColor = .red
        case .wifi:
            view.backgroundColor = .green
        case .wwan:
            view.backgroundColor = .yellow
        }

//        print("Reachability Summary")
//        print("Status:", status)
//        print("HostName:", Network.reachability?.hostname ?? "nil")
//        print("Reachable:", Network.reachability?.isReachable ?? "nil")
//        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
        
    }
    
    @objc func statusManager(_ notification: NSNotification) {
        verificaInternet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .flagsChanged, object: Network.reachability)
        verificaInternet()
        print("Reachability Summary")
//        print("Status:", status)
        print("HostName:", Network.reachability?.hostname ?? "nil")
        print("Reachable:", Network.reachability?.isReachable ?? "nil")
        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
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

//
//  ButtonTelasViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 18/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class ButtonTelasViewController: UIViewController {
    
    @IBAction func webViewBnt(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "webID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func variosBnt(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "variosID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func mapBnt(_ sender: Any) {
        
        performSegue(withIdentifier: "navmapID", sender: self)
        
    }
    
    @IBAction func textReturnBnt(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "textReturnID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tabBnt(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabControlID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func maps2Bnt(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "map2ID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func formataBnt(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "table2ID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func cepButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cepID")
        self.present(vc, animated: true, completion: nil)
    }
    

    @IBAction func ingressosButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ingressosID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func cryptoButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cryptoID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func alamoTesteButton(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alamoTesteID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func alamoTeste2Button(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alamoTeste2ID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func switfyJSONButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SwifyJSONID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func camposRegExButton(_ sender: Any) {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "camposRegExID")
            self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func coisasButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "coisasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func autoAdaptavelButton(_ sender: Any) {
        let autoAdaptavelID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "autoAdaptavelID")
        self.present(autoAdaptavelID, animated: true, completion: nil)
    }
    
    @IBAction func childButton(_ sender: Any) {
        
        let callChildID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "callChildID")
        self.present(callChildID, animated: true, completion: nil)
    
    }
    
    @IBAction func pageButton(_ sender: Any) {
        
        let pageViewID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageControllerID")
        self.present(pageViewID, animated: true, completion: nil)
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

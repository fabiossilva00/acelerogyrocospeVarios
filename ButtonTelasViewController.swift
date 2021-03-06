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
    
    @IBAction func pageViewButton(_ sender: Any) {
        let pageViewViewID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageViewViewID")
        self.present(pageViewViewID, animated: true, completion: nil)
    }
    
    @IBAction func bananasButton(_ sender: Any) {
        let bananaID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "bananaID")
        bananaID.modalPresentationStyle = .pageSheet
        bananaID.modalTransitionStyle = .crossDissolve
        self.present(bananaID, animated: true, completion: nil)
    }
    
    @IBAction func transitionTapButton(_ sender: Any) {
        let transition1ID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "transition1ID")
        self.present(transition1ID, animated: true, completion: nil)
    }
    
    @IBAction func miniAnimatedButton(_ sender: Any) {
        let miniAnimatedID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "miniAnimatedID")
//        self.present(miniAnimatedID, animated: true, completion: nil)
        miniAnimatedID.modalTransitionStyle = .partialCurl
        self.present(miniAnimatedID, animated: true, completion: nil)
        
    }
    
    @IBAction func agendaButton(_ sender: Any) {
        
        let agendaID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "agendaID")
        self.present(agendaID, animated: true, completion: nil)
        
    }
    
    @IBAction func navTesteButton(_ sender: Any) {
        
        let navTestesID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navTestesID")
        navTestesID.modalTransitionStyle = .flipHorizontal
        self.present(navTestesID, animated: true, completion: nil)
        
    }
    
    @IBAction func messagePodButton(_ sender: Any) {
        
        let messagePodID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "messagePodID")
        self.present(messagePodID, animated: true, completion: nil)
        
    }

    @IBAction func configuracoesButton(_ sender: Any) {
        let configuracoesID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "configuracoesID")
        self.present(configuracoesID, animated: true)
        
    }
    
    @IBAction func cryptSwiftButton(_ sender: Any) {
        let cryptSwiftID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cryptSwiftID")
        self.present(cryptSwiftID, animated: true)
        
    }
    
    @IBAction func internetTestButton(_ sender: Any) {
        let internetTesteID = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "internetTesteID")
        self.present(internetTesteID, animated: true)
        
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

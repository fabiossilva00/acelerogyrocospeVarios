//
//  TesteAPICandidatoViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 26/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class TesteAPICandidatoViewController: UIViewController {
    
    @IBOutlet weak var nomeText: UITextField!
    @IBOutlet weak var dataText: UITextField!
    @IBOutlet weak var telefoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var senhaText: UITextField!
    @IBOutlet weak var continuarButton: UIButton!
    
    let alamo = AlamoCandidato()
    
    func enviaDados() {
        
        alamo.candidatoPost(nome: nomeText.text!, data: dataText.text!, telefone: telefoneText.text!, email: emailText.text!, senha: senhaText.text!, sucess: { (sucess) in
            print(sucess)
            
            let viewCandidatoDados = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewCandidatoDados")
            self.present(viewCandidatoDados, animated: true, completion: nil)
            
            
        }, failure: { (failure) in
            print(failure)
            print("Erro")
        })
        
    }
    
    @IBAction func continuarButton(_ sender: Any) {
        enviaDados()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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

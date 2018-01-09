//
//  TerminaViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 09/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class TerminaViewController: UIViewController {
    
    var pacoteDetales: PacoteViagem? = nil
    
    @IBOutlet weak var imagePacote: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var hotelLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var voltaButton: UIButton!
    
    @IBAction func voltaButton(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "table2ID")
        self.present(vc, animated: true, completion: nil)
    }
    
    func atuaTela() {
        if let pacote = pacoteDetales{
            self.imagePacote.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.tituloLabel.text = pacote.viagem.titulo.uppercased()
            self.hotelLabel.text = pacote.nomeDoHotel
            self.dataLabel.text = pacote.dataViagem
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        atuaTela()
        
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

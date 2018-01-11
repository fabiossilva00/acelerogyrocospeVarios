//
//  DetalhesViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 03/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController{
    
    let arrayPacote: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    
    @IBOutlet weak var imagePacote: UIImageView!
    @IBOutlet weak var nomePacote: UILabel!
    @IBOutlet weak var descricaoPacote: UILabel!
    @IBOutlet weak var diasPacote: UILabel!
    @IBOutlet weak var validadePacote: UILabel!
    @IBOutlet weak var valorPacote: UILabel!
    @IBOutlet weak var image1Pacote: UIImageView!
    @IBOutlet weak var image2Pacote: UIImageView!
    @IBOutlet weak var image3Pacote: UIImageView!
    @IBOutlet weak var scrollPacote: UIScrollView!
    @IBOutlet weak var numeroText: UITextField!
    @IBOutlet weak var dataText: UITextField!
    @IBOutlet weak var terminaButton: UIButton!
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    @IBAction func dataText(_ sender: UITextField) {
        let datePicket = UIDatePicker()
        datePicket.datePickerMode = .date
        datePicket.locale = NSLocale.init(localeIdentifier: "pt-BR") as Locale
        sender.inputView = datePicket
        datePicket.addTarget(self, action: #selector(dataTexty(sender:)) , for: .valueChanged)
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func terminaButton(_ sender: Any) {

        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "terminaID") as! TerminaViewController
        vc.pacoteDetales = pacoteSelecionado
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    func atuTela(){
        
        if let pacote = pacoteSelecionado{
            imagePacote.image = UIImage(named: (pacote.viagem.caminhoDaImagem))
            nomePacote.text = pacote.viagem.titulo
            self.descricaoPacote.text = "Pacote: \(String(describing: pacote.descricao))"
            self.diasPacote.text = "\(String(describing: pacote.viagem.quantidadeDeDias)) Dias"
            validadePacote.text = pacote.dataViagem
        }
        image1Pacote.image = UIImage(named: "icon_airplane.png")
        image2Pacote.image = UIImage(named: "icon_hotel.png")
        image3Pacote.image = UIImage(named: "icon_breakfast.png")
        
    }
    
    @objc func pacoteScroll(notification: Notification){
        scrollPacote.contentSize = CGSize(width: self.scrollPacote.frame.width, height: self.scrollPacote.frame.height + 250)
    }
    
    @objc func dataTexty(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        dataText.text = formatter.string(from: sender.date)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pacoteScroll(notification:)), name: .UIKeyboardDidShow, object: nil)
        
        atuTela()
        
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

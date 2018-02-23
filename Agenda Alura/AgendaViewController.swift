//
//  AgendaViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 22/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CoreData

class AgendaViewController: UIViewController, ImagePickerSelecionado {
    
    @IBOutlet weak var imageFoto: UIImageView!
    @IBOutlet weak var fotoBUtton: UIButton!
    @IBOutlet weak var nomeText: UITextField!
    @IBOutlet weak var enderecoText: UITextField!
    @IBOutlet weak var telefoneText: UITextField!
    @IBOutlet weak var siteText: UITextField!
    @IBOutlet weak var imageStars: UIImageView!
    @IBOutlet weak var stepperAgenda: UIStepper!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let pickerImage = ImagePicker()
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func atualizaTela() {
        
        imageFoto.layer.borderWidth = 1.5
        imageFoto.layer.borderColor = UIColor.lightGray.cgColor
        imageFoto.layer.cornerRadius = self.imageFoto.frame.height / 2
        imageFoto.layer.masksToBounds = true
        //Tanto faz
//        imageFoto.layer.cornerRadius = self.imageFoto.frame.width / 2
        
    }
    
    func imageSelecionado(_ imagem: UIImage) {
        imageFoto.image = imagem
        
    }
    
    
//    func arrumaImage() {
//        pickerImage.delegate = self
//    }
    
//    func alertImage() {
//
//        let alertController = UIAlertController(title: "Escolha um das opcao:", message: "", preferredStyle: .actionSheet)
//        let cameraButton = UIAlertAction(title: "Camera", style: .default, handler: openCamera)
//        let galeriaButton = UIAlertAction(title: "Galeria", style: .destructive, handler: nil)
//        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//        alertController.addAction(cameraButton)
//        alertController.addAction(galeriaButton)
//        alertController.addAction(cancelButton)
//        self.present(alertController, animated: true, completion: nil)
//
//    }
//
//    func openCamera(alert: UIAlertAction) {
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//         let camera = UIImagePickerController()
//            camera.sourceType = .camera
//            camera.delegate = pickerImage
//            self.present(camera, animated: true, completion: nil)
//        }
//
//    }
//
//    func openGaleria(alert: UIAlertAction) {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            let galeria = UIImagePickerController()
//            galeria.sourceType = .photoLibrary
//        }
//    }
    
    func alertEscolha(_ alertOpcao: fotoAlert) {
        
        let acessoMidia = UIImagePickerController()
        acessoMidia.delegate = pickerImage.self
        fotoBUtton.setTitle("", for: .normal)
        
        if alertOpcao == .cameraButton && UIImagePickerController.isSourceTypeAvailable( .camera) {
            acessoMidia.sourceType = .camera
        }else{
             acessoMidia.sourceType = .photoLibrary

        }
        
        self.present(acessoMidia, animated: true, completion: nil)
        
    }
    
    @IBAction func fotoButton(_ sender: Any) {
        
        let alert = pickerImage.alertFoto(completion: { (escolha) in
            self.alertEscolha(escolha)
        })
        present(alert, animated: true, completion: nil)
//        alertImage()
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let agendaDados = AgendaDados(context: contexto)
        agendaDados.nome = nomeText.text!
        agendaDados.endereco = enderecoText.text!
        agendaDados.telefone = telefoneText.text!
        agendaDados.site = siteText.text!
        agendaDados.nota = 10.0
        agendaDados.imagem = imageFoto.image
        
        do {
         try contexto.save()
            navigationController?.popViewController(animated: true)
            print("Foi")
        }catch{
            print(error.localizedDescription)
        }
        
        
    }
    
    
    @objc func scrollPlus(_ notification: Notification) {
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + self.scrollView.frame.height / 2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atualizaTela()
        
        pickerImage.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector (scrollPlus(_:)), name: .UIKeyboardDidShow, object: nil)

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

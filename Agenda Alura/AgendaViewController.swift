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
    var agenda: AgendaDados?
    
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
        
        pickerImage.delegate = self
        guard let agendaSeleciona = agenda else { return }
        nomeText.text = agendaSeleciona.nome
        enderecoText.text = agendaSeleciona.endereco
        telefoneText.text = agendaSeleciona.telefone
        siteText.text = agendaSeleciona.site
        
        let gerenciaArquivos = FileManager.default
        
        let local = NSHomeDirectory() as NSString
        let localImage = local.appendingPathComponent(agendaSeleciona.imagem!)
        
        if gerenciaArquivos.fileExists(atPath: localImage) {
            imageFoto.image = UIImage(contentsOfFile: localImage)
        }
        
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
        
        if agenda == nil {
            agenda = AgendaDados(context: contexto)
        }
        
        let localImage = NSHomeDirectory() as NSString
        let pastaImages = "Documents/Images"
        let localCompleto = localImage.appendingPathComponent(pastaImages)
        let gerenciaFiles = FileManager.default
        print(localCompleto)
        
        if !gerenciaFiles.fileExists(atPath: localCompleto){
            do {
                try gerenciaFiles.createDirectory(atPath: localCompleto, withIntermediateDirectories: false, attributes: nil)
            }catch{
                print("Error \(error.localizedDescription)")
            }
        }
        
        let nameImage = String(format: "%@.jpeg", agenda!.objectID.uriRepresentation().lastPathComponent)
            print(nameImage)
        
        let urlImage = URL(fileURLWithPath: String(format: "%@/%@", localCompleto, nameImage))
            print(urlImage)
        
        guard let imagem = imageFoto.image else { return }
        guard let data = UIImagePNGRepresentation(imagem) else { return }
        
        do {
            try data.write(to: urlImage)
        }catch{
            print("Error \(error.localizedDescription)")
        }
        
        agenda?.nome = nomeText.text!
        agenda?.endereco = enderecoText.text!
        agenda?.telefone = telefoneText.text!
        agenda?.site = siteText.text!
        agenda?.nota = 10.0
        agenda?.imagem = String(format: "%@/%@", pastaImages, nameImage)
        
        do {
         try contexto.save()
            navigationController?.popViewController(animated: true)
            
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

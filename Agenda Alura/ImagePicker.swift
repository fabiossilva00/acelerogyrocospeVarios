//
//  ImagePicker.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 22/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

enum fotoAlert {
    case cameraButton
    case galeriaButton
}

protocol ImagePickerSelecionado {
    func imageSelecionado(_ imagem: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: ImagePickerSelecionado?
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imagem = info[UIImagePickerControllerOriginalImage] as! UIImage
            delegate?.imageSelecionado(imagem)
            picker.dismiss(animated: true, completion: nil)
//        print(imagem)
        
    }
    
    func alertFoto(completion:@escaping (_ opcao: fotoAlert) -> Void) -> UIAlertController {
        
        let alertController = UIAlertController(title: "", message: "Escolha uma das opcoes abaixo", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "Camera", style: .default, handler: { (termina) in
            completion(.cameraButton)
        })
        let galeriaButton = UIAlertAction(title: "Galeria", style: .default, handler: { (termina) in
            completion(.galeriaButton)
        })
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(cameraButton)
        alertController.addAction(galeriaButton)
        alertController.addAction(cancelButton)
        
        return alertController
    }
    
}

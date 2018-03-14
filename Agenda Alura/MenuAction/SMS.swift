//
//  SMS.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import MessageUI

class SMS: NSObject, MFMessageComposeViewControllerDelegate {
    
    func configuraSMS(_ agenda: AgendaDados) -> MFMessageComposeViewController? {
        
        if MFMessageComposeViewController.canSendText(){
            let compSMS = MFMessageComposeViewController()
            guard let numeroAgenda = agenda.telefone else { return compSMS}
            compSMS.recipients = [numeroAgenda]
            compSMS.body = "Teste de infomacoes, para ver se aparecem na mensagem"
            compSMS.messageComposeDelegate = self 
            
            return compSMS
        }
        
        return nil
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

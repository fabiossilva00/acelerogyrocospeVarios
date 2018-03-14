//
//  viewMessagePodView.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 12/03/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import SwiftMessages

class viewMessagePodView: MessageView {
    
    var entendi: (() -> Void)?
    var cancel: (() -> Void)?

    @IBAction func entendiButton() {
        
        entendi?()
        
    }
    
    @IBAction func cancelButton() {
        
        cancel?()
        
    }

}

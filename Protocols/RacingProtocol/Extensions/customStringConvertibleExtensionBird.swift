//
//  customStringConvertibleExtensionBird.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

extension CustomStringConvertible where Self: Bird {
    var description: String {
        return canFly ? "Voar eu posso" : "Mas vou sentar"
    }
    
}

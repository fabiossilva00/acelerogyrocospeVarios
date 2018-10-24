//
//  togglableProtocol.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle(){
        switch self {
        case .off:
            self = .off
        case .on:
            self = .on
        }
    }
}



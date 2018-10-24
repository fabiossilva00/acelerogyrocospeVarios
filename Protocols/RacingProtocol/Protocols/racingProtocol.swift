//
//  racingProtocol.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

protocol Bird: CustomStringConvertible {
    var name: String { get }
    var canFly : Bool { get }
    
}

protocol Flyable {
    var airSpeedVelocity: Double { get }
    
}

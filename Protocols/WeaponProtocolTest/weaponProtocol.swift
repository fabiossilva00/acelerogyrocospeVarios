//
//  weaponProtocol.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

protocol Weapon {
    var name: String { get }
    var canFire: Bool { get }
    var canCut: Bool { get }
    
}

protocol Fireable {
    var magazineSize: Int { get }

}

protocol Bombable: Fireable {
    var maxDistance: Double { get }
}

protocol Cuttable {
    var weight: Double { get }
    var steel: String { get }
}

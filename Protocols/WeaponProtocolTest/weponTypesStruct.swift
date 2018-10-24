//
//  weponTypesStruct.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

struct longSword: Weapon, Cuttable {
    let name: String
    let steel: String
    let weight = 7.2
}

struct AK47: Weapon, Fireable {
    let name = "AK47"
    let magazineSize = 30
}

struct Howitzer: Weapon, Bombable {
    let name = "Howitzer"
    let magazineSize = 1
    var maxDistance: Double = 1000
    
}

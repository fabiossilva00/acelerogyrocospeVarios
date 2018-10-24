//
//  weaponExtension.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

extension Weapon {
    var canFire: Bool { return self is Fireable}
    var canCut: Bool { return self is Cuttable}
    
}


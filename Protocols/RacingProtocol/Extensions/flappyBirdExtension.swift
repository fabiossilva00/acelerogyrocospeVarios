//
//  flappyBirdExtension.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

extension FlappyBird: Racer {
    var speed: Double {
        return airSpeedVelocity
    }
}

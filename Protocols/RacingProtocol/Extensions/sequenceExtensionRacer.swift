//
//  sequenceExtensionRacer.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 28/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element == Racer {
    func topSpeed() -> Double {
        return self.max(by: {
            $0.speed < $1.speed
        })?.speed ?? 0
    }
    
}

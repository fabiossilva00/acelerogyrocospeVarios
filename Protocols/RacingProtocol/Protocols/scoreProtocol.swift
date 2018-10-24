//
//  scoreProtocol.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 28/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

protocol Score: Equatable, Comparable {
    var value: Int { get }
    
}

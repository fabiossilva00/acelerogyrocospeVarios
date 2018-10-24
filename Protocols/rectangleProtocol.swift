//
//  rectangleProtocol.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 24/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

struct Rectangle {
    var width = 1
    var height = 1
    
    func area() -> Int {
        return width * height
    }
    
    mutating func scaleBy(value: Int) {
        width *= value
        height *= value
    }
}

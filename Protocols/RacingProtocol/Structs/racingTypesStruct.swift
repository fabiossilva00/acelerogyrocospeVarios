//
//  racingTypesStruct.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airSpeedVelocity: Double {
        return 3 * flappyAmplitude * flappyFrequency
    }
    
}

struct Penguin: Bird {
    let name: String
}

struct SwiftBird: Bird, Flyable {
    var name: String { return "Swift \(version)" }
    let version : Double
    
    var airSpeedVelocity: Double {
        return version * 10.0
    }
    
}

enum UnladenSwallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .african:
            return "African"
        case .european:
            return "European"
        case .unknown:
            return "Nao sei"
        }
    }
    
    var airSpeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 9.0
        case .unknown:
            fatalError("Fatal Error O.O")
        }
    }
    
}

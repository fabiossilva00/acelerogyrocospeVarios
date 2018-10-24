//
//  EmailModel.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 29/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

typealias entrarEmailCompletionHandler = (_ user: Any) -> Void

protocol LoginEmail {
    func entrarEmail(parameters: Login, completionHandler: @escaping entrarEmailCompletionHandler)
}

struct Login {
    var email: String
    var senha: String
    
}

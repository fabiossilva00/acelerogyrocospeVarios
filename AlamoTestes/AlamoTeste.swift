//
//  AlamoTeste.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 23/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

struct info {
    static var userID = "N0DfQV597WSGVoGWXNQjPmyOk1s2"
    static var email = "fabio@emailo.pro"
    static var senha = "123456"
    static var notificationToken = "cRgH5TgIqJ4:APA91bGznDDqg2ESpziYwOZuIL2v4QqWLCnb8ePlcB-mRphVNlh2Y8LLgOpwVAvi1j3m7UBIhW2EWhXuk-0tY83LzsLiz9qA-6gNk1RBOeIqCTki_BrPM1-Bsdllk-ges1jzRn1oJ1ef"
    static var loginToken = String()
}

struct url {
    static let login = URL(string: "http://zazzytec.com.br/auth")
    static let saldoGet = URL(string: "http://zazzytec.com.br/user_saldo")
}

struct dados {
    static var json = Data()
}

class AlamoTeste: NSObject {
    
    func login(sucess:@escaping (_ sucess: Any) -> Void, failure:@escaping(_ error: Any) -> Void){
        let parameters: Parameters=["id": info.userID, "email": info.email, "senha": info.senha, "notification_token": info.notificationToken]
        print(parameters)
        
        Alamofire.request(url.login!, method: .post, parameters: parameters, encoding:  JSONEncoding.default).validate().responseJSON(){ response in
            switch response.result {
            case .success:
                if let resposta = response.result.value{
                    let json = resposta as! NSDictionary
                    sucess(json)
                }
                break
            case.failure:
                failure(response)
                break
            }
        }
    }
    
    func loginCampos(email: String, senha: String, sucess:@escaping (_ sucess: AlamoTesteCampos) -> Void, failure:@escaping (_ error: Any) -> Void){
    
        let parameters: Parameters=["id": info.userID, "email": email, "senha": senha, "notification_token": info.notificationToken]
        
        Alamofire.request(url.login!, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON(){ response in
            switch response.result{
            case .success:
                if let resposta = response.result.value{
                    let json = resposta as! Dictionary<String, String>
                    sucess(AlamoTesteCampos(json))
                }
                break
            case .failure:
                if let dataFailure = response.data, let textData = String(data: dataFailure, encoding: .utf8) {
                    failure(textData)
                }
                break
            }
        }
        
    }
    
        let defaultManager: Alamofire.SessionManager = {
            let serverTrustPolicies: [String: ServerTrustPolicy] = [
                "bilbo.redepontocerto.com.br:8473": .disableEvaluation,
            ]

            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders

            return Alamofire.SessionManager(
                configuration: configuration,
                serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
            )
        }()
    
    func managerTeste() {
        
        let serverPolicie = ServerTrustPolicyManager(policies: ["bilbo.redepontocerto.com.br:8473": .disableEvaluation])
//        let serverPolicies: [String: ServerTrustPolicy] = ["redepontocerto.com.br": .disableEvaluation]
//        let serverPoliciess: [String: ServerTrustPolicy] = ["bilbo.redepontocerto.com.br": .pinCertificates(certificates: ServerTrustPolicy.certificates(), validateCertificateChain: false, validateHost: false)]
        let sessaoManager = SessionManager(serverTrustPolicyManager: serverPolicie ) /*ServerTrustPolicyManager(policies: serverPolicie)*/
        
        guard let urlRequest = URL(string: "https://bilbo.redepontocerto.com.br:8473/mobile-server-integracao-3.0/inicializar") else { return }
        
        let parametros: Parameters=["teste": 1]
        
        sessaoManager.request(urlRequest, method: .post, parameters: parametros, encoding: JSONEncoding.default).responseJSON { (response) in
            print(response.debugDescription)
        }
        
//        sessaoManager
        
    }
    
    func alamoTrust(){
        
        let parameters: Parameters=["teste": 1]
        
        guard let urlRequest = URL(string: "https://bilbo.redepontocerto.com.br:8473/mobile-server-integracao-3.0/inicializar") else { return }
        
        defaultManager.request(urlRequest, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON() { response in
            print(response.debugDescription)
            
//            switch response.result {
//            case .success:
//                print(response)
//                break
//            case .failure:
//                print(response)
//                break
//            }
            
        }
        
    }
    
}

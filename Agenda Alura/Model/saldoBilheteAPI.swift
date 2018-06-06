//
//  saldoBilheteAPI.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 04/06/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class saldoBilheteAPI: NSObject {
    
    func getSaldo(){
        
        guard let urlRequest = URL(string: "http://35.231.134.219:3000/bilhete/saldo/72") else { return }
        print(urlRequest)
        
        do {
            
            var request = URLRequest(url: urlRequest)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error == nil{
                    do {
                        guard let dat = data else { return }
                        
                        if let textData = String(data: dat, encoding: .utf8){
                            print(textData)
                        }
                        
//                        let saldo = try JSONSerialization.jsonObject(with: data!, options: [])
                        let saldo = try? JSONSerialization.jsonObject(with: dat, options: [])
                        
                        print(saldo)
                        print(response)
                    } catch {
                        print("1")
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        } catch {
            print("2")
            print(error.localizedDescription)
        }
        
        
    }
    
//    func loginAPI() {
//        
//        guard let urlRequest = URL(string: "http://35.231.134.219:3000/auth") else { return }
//        
//        var request = URLRequest(url: urlRequest)
//        
//        request.httpMethod = "POST"
//        
//        let dicio = ["email": "teste05@teste.com", "senha": "123456"]
//        
//        do {
//            
//        }
//        let data = try JSONSerialization.data(withJSONObject: dicio, options: [])
//        
//        request.httpBody = data
//        
//        
//    }

}

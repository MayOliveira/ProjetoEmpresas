//
//  Networking.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 10/04/21.
//

import Foundation

class Networking {
    
    enum HeaderKeys: String {
        case uid
        case client
        case accessToken = "access-token"
    }
    
    func placeOrder(order: Companies) {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }

        let link = "https://empresas.ioasys.com.br/api/v1/users/auth/sign_in"
        guard let url = URL(string: link) else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = encoded

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print(response as Any)
            
            if let response = response as? HTTPURLResponse {
                
                let headers = response.allHeaderFields
                
                let accessToken = HeaderKeys.accessToken.rawValue
                let client = HeaderKeys.client.rawValue
                let uid = HeaderKeys.uid.rawValue
                
                let headerDictionary = [accessToken: headers[accessToken] as Any,
                                        client: headers[client] as Any,
                                        uid: headers[uid] as Any]
              
                let userDefaults = UserDefaults.standard
                userDefaults.setValuesForKeys(headerDictionary)
            }
            
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(User.self, from: data) {
                print(decodedOrder)
                
            } else {
                print("Invalid response from server")
            } 
        }
        
        task.resume()
    }
}

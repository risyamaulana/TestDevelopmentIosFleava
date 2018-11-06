//
//  LoginModel.swift
//  Developer
//
//  Created by Risya Maulana on 06/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit

class LoginModel: NSObject {
    
//    param data for login
    func getLoginParameter(email:String, password:String) -> [String : String] {
        let parameters = [
            "email": email,
            "password": password
        ]
        
        return parameters
    }
    
//    header login request
    func headersForLogin() -> [String : String]{
        let headers = [
            "Content-Type": "application/json"
        ]
        return headers
    }
    
//    authorization token header for secret request
    func headerForSecretLogin(token:String) -> [String : String]{
        let headers = [
            "Content-Type": "application/json",
            "authorization": "Bearer \(token)"
        ]
        return headers
    }
}

//
//  AuthNetowrking.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation

enum AuthNetowrking {
    case login(userName: String,password: String)
}

extension AuthNetowrking: TargetType {
    var baseURL: Api {
        return .baseUrl
    }
    
    var path: Api {
        switch self {
            case .login:
                return .login
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .login:
                return .post
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .login(let username,let password):
                return .requestParameters(parameters: ["Email": username,"Password": password])
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .login:
                return [:]
        }
    }
    
    
}

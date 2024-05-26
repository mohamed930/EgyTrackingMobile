//
//  AuthNetowrking.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation

enum AuthNetowrking {
    case login(userName: String,password: String)
    case logout(token: String)
}

extension AuthNetowrking: TargetType {
    var baseURL: Api {
        return .baseUrl
    }
    
    var path: Api {
        switch self {
            case .login:
                return .login
            case .logout:
                return .logout
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .login:
                return .post
            case .logout:
                return .delete
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .login(let username,let password):
            return .requestParameters(parameters: ["Email": username,"Password": password],endcoding: .body)
            case .logout:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .login:
                return [:]
        case .logout(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
    
    
}

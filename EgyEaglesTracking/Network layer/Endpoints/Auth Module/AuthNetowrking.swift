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
    case userProfile(token: String)
}

extension AuthNetowrking: TargetType {
    var baseURL: Api {
        return .baseTracking
    }
    
    var path: Api {
        switch self {
            case .login:
                return .login
            case .logout:
                return .logout
            case .userProfile:
                return .profile
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .login:
                return .post
            case .logout:
                return .delete
            case .userProfile:
                return .get
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .login(let username,let password):
            return .requestParameters(parameters: ["Email": username,"Password": password],endcoding: .body)
            case .logout:
                return .requestPlain
            case .userProfile:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .login:
                return [:]
        case .logout(let token),
             .userProfile(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
    
    
}

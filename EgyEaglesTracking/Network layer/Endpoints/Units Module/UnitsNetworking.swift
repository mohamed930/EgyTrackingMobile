//
//  UnitsNetworking.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 21/06/2024.
//

import Foundation

enum UnitsNetworking {
    case unitForBinding(token: String)
}

extension UnitsNetworking: TargetType {
    var baseURL: Api {
        return .baseTracking
    }
    
    var path: Api {
        switch self {
            case .unitForBinding:
                return .bindUnit
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .unitForBinding:
                return .get
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .unitForBinding:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .unitForBinding(let token):
                return ["Authorization": "Bearer \(token)"]
        }
    }
    
    
}

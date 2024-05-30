//
//  HomeNetworking.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import Foundation

enum HomeNetworking {
    case fetchVehiclesForUser(token: String)
    case fetchCompanies(token: String)
}

extension HomeNetworking: TargetType {
    var baseURL: Api {
        return .baseTracking
    }
    
    var path: Api {
        switch self {
            case .fetchVehiclesForUser:
                return .vehicles
            case .fetchCompanies:
                return .allCompanies
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .fetchVehiclesForUser , .fetchCompanies:
                return .get
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .fetchVehiclesForUser:
                return .requestParameters(parameters: ["pageNumber": 1,"pageSize": 25], endcoding: .parmters)
            case .fetchCompanies:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .fetchVehiclesForUser(let token),
                 .fetchCompanies(let token):
                return ["Authorization": "Bearer \(token)"]
        }
    }
    
    
}

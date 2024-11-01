//
//  UnitsNetworking.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 21/06/2024.
//

import Foundation

enum UnitsNetworking {
    case unitForBinding(token: String)
    case bindUnitToVehilce(iemi: String,vehicleId: String,token: String)
    case fetchAllUnits(token: String)
}

extension UnitsNetworking: TargetType {
    var baseURL: Api {
        return .baseTracking
    }
    
    var path: Api {
        switch self {
            case .unitForBinding:
                return .bindUnit
            case .bindUnitToVehilce:
                return .bindUnitToVehilce
            case .fetchAllUnits:
                return .allUnits
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .unitForBinding , .fetchAllUnits:
                return .get
            case .bindUnitToVehilce:
                return .put
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .unitForBinding:
                return .requestPlain
            case .bindUnitToVehilce(let iemi,let vehicleId,_):
                return .requestParameters(parameters: ["vehicleId": vehicleId,"imei": iemi], endcoding: .body)
            case .fetchAllUnits:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .unitForBinding(let token),
                 .bindUnitToVehilce(_,_,let token),
                 .fetchAllUnits(let token):
                return ["Authorization": "Bearer \(token)"]
        
        }
    }
    
    
}

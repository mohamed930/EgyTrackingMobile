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
    case deleteCompany(id: String,token: String)
    
    case addCompany(customerModel: CustomerModel,token: String)
    case updateCompany(customerModel: CustomerModel,token: String)
    
    case deleteVehicle(id: String,token: String)
    
    case addVehicle(vehicleModel: AddVehicleModel, token: String)
    case updateVehicle(vehicleModel: AddVehicleModel, token: String)
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
            case .deleteCompany:
                return .allCompanies
            case .addCompany:
                return .addCompany
            case .updateCompany:
                return .updateCompany
            case .deleteVehicle:
                return .deleteVehicle
            case .addVehicle:
                return .addVehicle
            case .updateVehicle:
                return .updateVehicle
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .fetchVehiclesForUser , .fetchCompanies:
                return .get
            
            case .deleteCompany, .deleteVehicle:
                return .delete
            case .addCompany , .addVehicle:
                return .post
            case .updateCompany , .updateVehicle:
                return .put
        }
    }
    
    var task: TaskOperation {
        switch self {
            case .fetchVehiclesForUser:
                return .requestParameters(parameters: ["pageNumber": 1,"pageSize": 25], endcoding: .parmters)
            
            case .fetchCompanies:
                return .requestPlain
            
            case .deleteCompany(let id,_):
                return .requestParameters(parameters: ["CustomerId": id], endcoding: .url)
            
            case .addCompany(let model,_),.updateCompany(let model,_):
                return .requestParameters(parameters: model.dictionary, endcoding: .body)
        
            case .deleteVehicle(let id,_):
                return .requestParameters(parameters: ["vehicleId": id], endcoding: .parmters)
            
            case .addVehicle(let model,_):
                return .requestParameters(parameters: model.dictionary, endcoding: .body)
            
            case .updateVehicle(let model,_):
                return .requestParameters(parameters: model.dictionary, endcoding: .body)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .fetchVehiclesForUser(let token),
                 .fetchCompanies(let token),
                 .deleteCompany(_,let token),
                 .addCompany(_,let token),
                 .updateCompany(_,let token),
                 .deleteVehicle(_,let token),
                 .addVehicle(_,let token),
                 .updateVehicle(_,let token):
                return ["Authorization": "Bearer \(token)"]
        }
    }
    
    
}

//
//  UnitsAPI.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 21/06/2024.
//

import Foundation

protocol UnitsAPIProtocol {
    func fetchUnitsForBinding() async throws -> BaseModel<[UnitsForBindingModel]>
    func bindToUnitForVehicle(iemi: String,vehicleId: String) async throws -> BaseModelWithoutData
}

class UnitsAPI: BaseAPI<UnitsNetworking>, UnitsAPIProtocol {
    
    func fetchUnitsForBinding() async throws -> BaseModel<[UnitsForBindingModel]> {
        try await fetchData(Target: .unitForBinding(token: self.fetchUserToken()))
    }
    
    
    func bindToUnitForVehicle(iemi: String,vehicleId: String) async throws -> BaseModelWithoutData {
        try await fetchData(Target: .bindUnitToVehilce(iemi: iemi, vehicleId: vehicleId, token: self.fetchUserToken()))
    }
}

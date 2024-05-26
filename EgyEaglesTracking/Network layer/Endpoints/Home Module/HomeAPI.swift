//
//  HomeAPI.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import Foundation

protocol HomeApiProtocol {
    func fetchVehicles() async throws -> BaseModel<carResponse>
}

class HomeAPI: BaseAPI<HomeNetworking>, HomeApiProtocol {
    
    func fetchVehicles() async throws -> BaseModel<carResponse> {
        try await fetchData(Target: .fetchVehiclesForUser(token: self.fetchUserToken()))
    }
    
}

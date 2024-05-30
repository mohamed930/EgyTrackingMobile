//
//  HomeAPI.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import Foundation

protocol HomeApiProtocol {
    func fetchVehicles() async throws -> BaseModel<carResponse>
    func fetchAllCompanies() async throws -> BaseModel<CompanyResponse>
}

class HomeAPI: BaseAPI<HomeNetworking>, HomeApiProtocol {
    
    func fetchVehicles() async throws -> BaseModel<carResponse> {
        try await fetchData(Target: .fetchVehiclesForUser(token: self.fetchUserToken()))
    }
    
    func fetchAllCompanies() async throws -> BaseModel<CompanyResponse> {
        try await fetchData(Target: .fetchCompanies(token: self.fetchUserToken()))
    }
    
}

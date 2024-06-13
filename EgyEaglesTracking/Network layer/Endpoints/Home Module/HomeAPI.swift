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
    func deleteCompany(customerId: String) async throws -> BaseModel<CompanyResponse>
    func addCompany(customerModel: CustomerModel) async throws -> BaseModel<CompanyResponse>
    func updateCompany(customerModel: CustomerModel) async throws -> BaseModel<companyUpdateModel>
    func deleteVehicle(vehicleId: String) async throws -> BaseModel<carResponse>
}

class HomeAPI: BaseAPI<HomeNetworking>, HomeApiProtocol {
    
    func fetchVehicles() async throws -> BaseModel<carResponse> {
        try await fetchData(Target: .fetchVehiclesForUser(token: self.fetchUserToken()))
    }
    
    func fetchAllCompanies() async throws -> BaseModel<CompanyResponse> {
        try await fetchData(Target: .fetchCompanies(token: self.fetchUserToken()))
    }
    
    func deleteCompany(customerId: String) async throws -> BaseModel<CompanyResponse> {
        try await fetchData(Target: .deleteCompany(id: customerId, token: self.fetchUserToken()))
    }
    
    func addCompany(customerModel: CustomerModel) async throws -> BaseModel<CompanyResponse> {
        try await fetchData(Target: .addCompany(customerModel: customerModel, token: self.fetchUserToken()))
    }
    
    func updateCompany(customerModel: CustomerModel) async throws -> BaseModel<companyUpdateModel> {
        try await fetchData(Target: .updateCompany(customerModel: customerModel, token: self.fetchUserToken()))
    }
    
    func deleteVehicle(vehicleId: String) async throws -> BaseModel<carResponse> {
        try await fetchData(Target: .deleteVehicle(id: vehicleId, token: self.fetchUserToken()))
    }
}

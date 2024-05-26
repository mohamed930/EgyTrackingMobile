//
//  HomeViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @AppStorage("token") var token = ""
    
    @Published var carArray = Array<CarsModel>()
    @Published var numberOfCars: String?
    
    private var authapi = AuthAPI()
    private var homeapi = HomeAPI()
    
    func removeToken() {
        token = ""
    }
    
    func logout() async -> Bool {
        do {
            let response = try await authapi.logout()
            
            return response.success
        }
        catch {
            return false
        }
        
    }
    
    func fetchCarsOperation() async -> Bool  {
        
        do {
            let response = try await homeapi.fetchVehicles()
            
            if response.success {
                guard let data = response.data else { return true }
                
                if !data.result.isEmpty {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        
                        self.carArray = data.result
                        self.numberOfCars = "\(data.result.count)"
                    }
                    
                }
                else {
                    print("there is no cars.")
                }
            }
            else {
                print(response.message)
            }
        }
        catch {
            guard let error = error as? ErrorMessage else { return true }
            
            switch error {
            case .invalidUrl:
                print("Invalid URl")
            case .invalidResponse:
                print("Invalid Response")
            case .invalidParameters:
                print("Invalid Parameters")
            case .invalidData:
                print("Invalid Data")
            }
        }
        
        return true
    }
}

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
    @Published var loginAgain: Bool = false
    
    @Published var username: String = ""
    
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
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.numberOfCars = "0"
                    }
                    
                    
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
            case .invalidToken:
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    self.loginAgain = true
                }
            }
        }
        
        return true
    }
    
    func fetchUserInfo() async {
        do {
            let response = try await authapi.fetchProfile()
            
            guard let data = response.data else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.username = data.firstName + " " + data.lastName
            }
            
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

//
//  VehicleViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 13/06/2024.
//

import SwiftUI

class VehicleViewModel: ObservableObject {
    @Published var data = [CarsModel]()
    @Published var count = -1
    
    @Published var isloading = false
    
    var vehicleId: String = ""
    
    private let homeapi = HomeAPI()
    
    func fetchData() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            isloading.toggle()
        }
        
        do {
            let response = try await homeapi.fetchVehicles()
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                isloading.toggle()
            }
            
            if response.success {
                guard let data = response.data else { return }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    self.data = data.result
                    count = self.data.count
                }
                
            }
            else {
                print(response.message)
            }
        }
        catch {
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                isloading.toggle()
            }
            
            print(error.localizedDescription)
        }
    }
    
    func deleteVehicle() async {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.isloading.toggle()
        }
        
        do {
            let response = try await homeapi.deleteVehicle(vehicleId: vehicleId)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.isloading.toggle()
            }
            
            if response.success {
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    guard let index = data.firstIndex(where: {$0.carId == self.vehicleId}) else { return }
                    
                    data.remove(at: index)
                    count = data.count
                }
                
            }
        }
        catch {
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.isloading.toggle()
            }
            
            print(error.localizedDescription)
        }
    }
}

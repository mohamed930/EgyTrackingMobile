//
//  AddVehicleViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 15/06/2024.
//

import SwiftUI

class AddVehicleViewModel: ObservableObject {
    
    @Published var isloading = false
    @Published var success: Bool!
    
    @Published var model: AddVehicleModel!
    
    private let homeapi = HomeAPI()
    
    func addVehicle() async  {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            isloading.toggle()
        }
        
        do {
            
            guard let model else { return }
            
            let response = try await homeapi.addVehicle(vehicleModel: model)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                isloading.toggle()
            }
            
            if response.success {
                success = true
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
    
}

//
//  UnitViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 13/07/2024.
//

import SwiftUI

class UnitViewModel: ObservableObject {
    @Published var data = [UnitModel]()
    @Published var count = 0
    
    @Published var isloading = false
    
    private let unitapi = UnitsAPI()
    
    func fetchData() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            isloading.toggle()
        }
        
        do {
            let response = try await unitapi.fetchAllUnits()
            
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
}

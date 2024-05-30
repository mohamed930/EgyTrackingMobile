//
//  CompanyViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI

class CompanyViewModel: ObservableObject {
    
    private let homeapi = HomeAPI()
    
    @Published var isloading = false
    
    @Published var companies = Array<CompanyModel>()
    @Published var count: String = ""
    
    func fetchCompanies() async {
        DispatchQueue.main.async { [weak self] in
            self?.isloading = true
        }
        
        
        do {
            let response = try await homeapi.fetchAllCompanies()
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.isloading = false
            }
            
            if response.success {
                guard let data = response.data else { return }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    self.companies = data.result
                    self.count = "\(data.result.count)"
                }
                
            }
            else {
                print(response.message)
            }
            
        }
        catch {
            DispatchQueue.main.async { [weak self] in
                self?.isloading = false
            }
            
            print(error.localizedDescription)
        }
    }
    
}

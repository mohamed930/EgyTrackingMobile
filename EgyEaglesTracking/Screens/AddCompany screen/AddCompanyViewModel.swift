//
//  AddCompanyViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 03/06/2024.
//

import Foundation

class AddCompanyViewModel: ObservableObject {
    @Published var data: [String] = Array<String>()
    
    @Published var isloading = false
    @Published var success: Bool!
    @Published var error: Bool = false
    
    
    private let homeapi = HomeAPI()
    var companyData: CustomerModel!
    
    func fetchData() {
        for i in TSPCompanies.shared.data {
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.data.append(i.companyName)
            }
        }
    }
    
    
    func addCompanyData() async {
        isloading = true
        
        do {
            
            let response = try await homeapi.addCompany(customerModel: companyData)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                isloading = false
                if response.success {
                    success = true
                }
                else {
                    error = true
                }
            }
            
        }
        catch {
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                isloading = false
            }
            
            print(error.localizedDescription)
        }
    }
}

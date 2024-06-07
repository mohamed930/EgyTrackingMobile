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
    
    @Published var companyName: Bool!
    
    
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
            guard let model = JwtDecode.shared.decode() else { return }
            companyData.adminId = model.uid.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
            companyData.upLevelId = model.pCid
            
            let response = try await homeapi.addCompany(customerModel: companyData)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                print(response.success)
                print(response.message)
                
                isloading = false
                if response.success {
                    success = true
                }
                else {
                    error = true
                    
                    if response.message.contains("CompanyName") {
                        print("we are here!!!")
                        companyName = true
                    }
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

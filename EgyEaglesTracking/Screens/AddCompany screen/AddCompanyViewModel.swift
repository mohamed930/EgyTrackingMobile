//
//  AddCompanyViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 03/06/2024.
//

import SwiftUI

class AddCompanyViewModel: ObservableObject {
    @Published var data: [String] = Array<String>()
    
    @Published var isloading = false
    @Published var success: Bool!
    @Published var error: Bool = false
    
    @Published var companyName: Bool? = false
    @Published var phoneNumber: Bool? = false
    @Published var identity: Bool? = false
    @Published var binding: Bool? = false
    
    
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
                        companyName = true
                    }
                    else if response.message.contains("Phone number") {
                        companyName = false
                        identity = false
                        phoneNumber = true
                    }
                    else if response.message.contains("IdentityNumber") {
                        identity?.toggle()
                        companyName = false
                        phoneNumber = false
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
    
    func updateCompanyData(company: CompanyModel) async {
        isloading = true
        
        do {
            guard let model = JwtDecode.shared.decode() else { return }
            companyData.adminId = model.uid.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
            companyData.upLevelId = model.pCid
            
            companyData.Id = company.cid
            
            let response = try await homeapi.updateCompany(customerModel: companyData)
            
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
                        companyName = true
                    }
                    else if response.message.contains("Phone number") {
                        companyName = false
                        identity = false
                        phoneNumber = true
                    }
                    else if response.message.contains("IdentityNumber") {
                        identity?.toggle()
                        companyName = false
                        phoneNumber = false
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

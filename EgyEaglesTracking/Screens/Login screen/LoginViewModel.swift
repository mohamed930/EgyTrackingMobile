//
//  LoginViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    let authapi = AuthAPI()
    
    @Published var islogin: Bool?
    
    @AppStorage("token") var token = ""
    
    func login(username: String,password: String) async {
        
        do {
            let response = try await authapi.login(userName: username, password: password)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.islogin = response.success
                
                guard let data = response.data else { return }
                
                self.token   = data.token
            }
            
        }
        catch {
            print("Error: \(error)")
        }
    }
}

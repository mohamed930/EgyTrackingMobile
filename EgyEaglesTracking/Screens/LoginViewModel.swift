//
//  LoginViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    let authapi = AuthAPI()
    
    @Published var user: BaseModel<UserData>?
    
    func login(username: String,password: String) async {
        
        do {
            let response = try await authapi.login(userName: username, password: password)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                print(response)
                self.user = response
            }
            
        }
        catch {
            print("Error: \(error)")
        }
    }
}

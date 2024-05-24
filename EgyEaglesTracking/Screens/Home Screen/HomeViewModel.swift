//
//  HomeViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @AppStorage("token") var token = ""
    
    private var authapi = AuthAPI()
    
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
}

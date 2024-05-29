//
//  AuthAPI.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation

protocol AuthProtocol {
    func login(userName: String,password: String) async throws -> BaseModel<UserData>
    func logout() async throws -> BaseModel<UserData>
    func fetchProfile() async throws -> BaseModel<UserModel>
}

class AuthAPI: BaseAPI<AuthNetowrking>, AuthProtocol {
    
    func login(userName: String, password: String) async throws -> BaseModel<UserData> {
        try await fetchData(Target: .login(userName: userName, password: password))
    }
    
    func logout() async throws -> BaseModel<UserData> {
        try await fetchData(Target: .logout(token: self.fetchUserToken()))
    }
    
    func fetchProfile() async throws -> BaseModel<UserModel> {
        try await fetchData(Target: .userProfile(token: self.fetchUserToken()))
    }
}

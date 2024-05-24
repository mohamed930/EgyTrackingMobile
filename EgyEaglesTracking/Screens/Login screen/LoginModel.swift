//
//  LoginModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation

struct UserData: Codable {
    let message: String
    let isAuthenticated: Bool
    let userName, email, token: String
    let isAuthenticatedAnotherDevice: Bool
    let expiresOn: String
    let refreshToken, refreshTokenExpiresOn, customerName: String

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case isAuthenticated = "IsAuthenticated"
        case userName = "UserName"
        case email = "Email"
        case token = "Token"
        case isAuthenticatedAnotherDevice = "IsAuthenticatedAnotherDevice"
        case expiresOn = "ExpiresOn"
        case refreshToken = "RefreshToken"
        case refreshTokenExpiresOn = "RefreshTokenExpiresOn"
        case customerName = "CustomerName"
    }
}

//
//  Api.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation


enum Api: String {
    case baseUrl = "https://authapi.lamar-sa.com/"
    case baseTracking = "https://eggpsapi.lamar-sa.com/"
    case login = "api/authentication/signin"
    case logout = "api/authentication/LogOut"
    case vehicles = "api/Vehicles"
    case profile = "api/User/Profile"
    case allCompanies = "api/OperationCompany"
    case deleteCompany = "api/OperationCompany/DeleteOperationCompany"
    case addCompany = "api/OperationCompany/CreateOperationCompany"
}

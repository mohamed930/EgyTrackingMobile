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
    case addCompany = "api/OperationCompany/CreateOperationCompany"
    case updateCompany = "api/OperationCompany/UpdateOperationCompany"
    case deleteVehicle = "api/Vehicles/DeleteVehicle"
    case addVehicle = "api/Vehicles/CreateVehicle"
    case bindUnit = "api/Vehicles/Units"
    case bindUnitToVehilce = "api/Vehicles/Bind"
    case updateVehicle = "api/Vehicles/UpdateVehicle"
}

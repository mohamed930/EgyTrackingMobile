//
//  JwtDecode.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 07/06/2024.
//

import SwiftUI
import JWTDecode

struct Lamar: Codable {
    let sub: String
    let waslId: String
    let iss: String
    let xApiKey: String
    let cType: String
    let permission: [Permission]
    let aud: String
    let uid: String
    let pCid: String
    let exp: Int
    let jti: String
    let uemail: String
    let role: String
    
    enum CodingKeys: String, CodingKey {
        case sub
        case waslId = "WaslId"
        case iss
        case xApiKey = "XapiKey"
        case cType = "CType"
        case permission = "Permission"
        case aud
        case uid
        case pCid = "PCid"
        case exp
        case jti
        case uemail
        case role = "Role"
    }
}

enum Permission: String, Codable {
    case auth = "Auth"
    case tracking = "Tracking"
    case owner = "Owner"
    case dealer = "Dealer"
    case viewRoles = "ViewRoles"
    case createRole = "CreateRole"
    case deleteRole = "DeleteRole"
    case updateRole = "UpdateRole"
    case activeRole = "ActiveRole"
    case viewRole = "ViewRole"
    case viewUsers = "ViewUsers"
    case createUser = "CreateUser"
    case deleteUser = "DeleteUser"
    case updateUser = "UpdateUser"
    case activeUser = "ActiveUser"
    case viewUser = "ViewUser"
    case createBasicAdmin = "CreateBasicAdmin"
    case deleteBasicAdmin = "DeleteBasicAdmin"
    case viewCompanies = "ViewCompanies"
    case viewCompany = "ViewCompany"
    case createCompany = "CreateCompany"
    case updateCompany = "UpdateCompany"
    case deleteCompany = "DeleteCompany"
    case activeCompany = "ActiveCompany"
    case getAllDeleted = "GetAllDeleted"
    case returnFromDeleted = "ReturnFromDeleted"
    case deleteOperationCompanyFromWasl = "DeleteOperationCompanyFromWasl"
    case viewVehicles = "ViewVehicles"
    case viewVehicle = "ViewVehicle"
    case createVehicle = "CreateVehicle"
    case updateVehicle = "UpdateVehicle"
    case deleteVehicle = "DeleteVehicle"
    case activeVehicle = "ActiveVehicle"
    case deleteVehicleFromWasl = "DeleteVehicleFromWasl"
    case addIcons = "AddIcons"
    case viewIcons = "ViewIcons"
    case unBind = "UnBind"
    case bind = "Bind"
    case addVehicleToWasl = "AddVehicleToWasl"
    case updateVehicleFromWasl = "UpdateVehicleFromWasl"
    case viewUnits = "ViewUnits"
    case viewUnit = "ViewUnit"
    case deleteUnit = "DeleteUnit"
    case createUnit = "CreateUnit"
    case updateUnit = "UpdateUnit"
    case activeUnit = "ActiveUnit"
    case createSensor = "CreateSensor"
    case updateSensor = "UpdateSensor"
    case viewSensors = "ViewSensors"
    case deleteSensor = "DeleteSensor"
    case createDriver = "CreateDriver"
    case updateDriver = "UpdateDriver"
    case viewDrivers = "ViewDrivers"
    case viewDriver = "ViewDriver"
    case deleteDriver = "DeleteDriver"
    case activeDriver = "ActiveDriver"
    case deleteDriverFromWasl = "DeleteDriverFromWasl"
    case createVehicleGroup = "CreateVehicleGroup"
    case updateVehicleGroup = "UpdateVehicleGroup"
    case deleteVehicleGroup = "DeleteVehicleGroup"
    case viewVehicleGroup = "ViewVehicleGroup"
    case getAllApprovalRequestsVehicle = "GetAllApprovalRequestsVehicle"
    case getAllApprovalRequestsUnit = "GetAllApprovalRequestsUnit"
    case getAllApprovalRequestsSensor = "GetAllApprovalRequestsSensor"
    case acceptApprovalRequests = "AcceptApprovalRequests"
}


class JwtDecode {
    static var shared = JwtDecode()
    
    @AppStorage("token") var token = ""
    
    func decode() -> Lamar? {
        do {
            let jwt = try JWTDecode.decode(jwt: self.token)
            
            let data = convertDictionaryToLamar(jwt.body)
            
            return data
            
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    private func convertDictionaryToLamar(_ dictionary: [String: Any]) -> Lamar? {
        do {
            // Convert the dictionary to JSON data
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            
            // Decode the JSON data to an instance of Lamar
            let lamar = try JSONDecoder().decode(Lamar.self, from: jsonData)
            
            return lamar
        } catch {
            print("Error converting dictionary to Lamar: \(error)")
            return nil
        }
    }
    
    
}

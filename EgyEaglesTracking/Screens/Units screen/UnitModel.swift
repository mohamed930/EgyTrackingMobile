//
//  UnitModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 13/07/2024.
//

import Foundation

struct UnitResponse: Codable {
    let result: [UnitModel]
}

struct UnitModel: Identifiable, Codable {
    var id = UUID()
    let sId, upsertDate, updsertBy: String
    let isActive: Bool
    let curdOperation: Int
    let imei, customerID: String
    let vehicleID: String?
    let deviceType: String
    let devicePassword, deviceSerial: String
    let vehicleName: String?
    let manufacturerName, deviceProtocol, deviceModel: String

    enum CodingKeys: String, CodingKey {
        case sId = "Id"
        case upsertDate
        case updsertBy = "UpdsertBy"
        case isActive = "IsActive"
        case curdOperation = "CurdOperation"
        case imei = "IMEI"
        case customerID = "CustomerId"
        case vehicleID = "VehicleId"
        case deviceType = "DeviceType"
        case devicePassword = "DevicePassword"
        case deviceSerial = "DeviceSerial"
        case vehicleName = "VehicleName"
        case manufacturerName = "ManufacturerName"
        case deviceProtocol = "DeviceProtocol"
        case deviceModel = "DeviceModel"
    }
}

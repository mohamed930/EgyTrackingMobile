//
//  CarsModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import Foundation

struct carResponse: Codable {
    let result: [CarsModel]
}

struct CarsModel: Identifiable, Codable {
    var id = UUID()
    let carId: String
    let inActive: Bool
    let vehicleModel: String?
    let minSpeed: Double
    let vehiclePlate: VehiclePlate
    let manufacturingYear: String?
    let imeiNumber: String?
    let plateType: Int
    let sequenceNumber: String
    
    enum CodingKeys: String, CodingKey {
        case carId = "Id"
        case inActive = "IsActive"
        case vehicleModel = "VehicleModel"
        case minSpeed = "MinSpeed"
        case vehiclePlate
        case manufacturingYear = "ManufacturingYear"
        case imeiNumber , plateType , sequenceNumber
    }
}

// MARK: - VehiclePlate
struct VehiclePlate: Codable {
    let number, rightLetter, middleLetter, leftLetter: String
    
    var dictionary: [String: Any] {
        return [
            "number": number,
            "rightLetter": rightLetter,
            "middleLetter": middleLetter,
            "leftLetter": leftLetter,
        ]
    }
}

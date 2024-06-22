//
//  AddVehicleModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 15/06/2024.
//

import Foundation

struct AddVehicleModel: Codable {
    var OwnerID: String? = nil
    var TrailerId: String? = nil
    var DriverId: String? = nil
    var Imei: String? = nil
    var ChaisisNumber: String? = nil
    var Icon: String? = nil
    var BusinessTypeWaste: Bool = false
    var activity: String = "Default"
    var FuelType: String? = nil
    var VehicleType: String? = nil
    var Name: String? = nil
    var VIN: String? = nil
    var VehicleModel: String? = nil
    var ManufacturingYear: String? = nil
    var SeatsNumber: String? = nil
    var sequenceNumber: String
    var plateType: String
    var CustomerId: String
    var MovementDetection: String? = nil
    var MinSpeed: String = "0"
    var MinStop: String = "0"
    var MinPark: String = "0"
    var MinSat: String = "0"
    var MaxDistanceMSG: String = "0"
    var MinTripTime: String = "0"
    var MinTripDistance: String = "0"
    var FuelConsumption_SummerRate: String = "0"
    var FuelConsumption_WinterRate: String = "0"
    var AddToWasl: Bool = false
    var BusinessTypeTransportation: Bool = false
    var BusinessTypeWater: Bool = false
    var BusinessTypeHajj: Bool = false
    var vehiclePlate: VehiclePlate

    // Computed property to convert to dictionary
    var dictionary: [String: Any] {
        return [
            "sequenceNumber": sequenceNumber,
            "plateType": plateType,
            "CustomerId": CustomerId,
            "MinSpeed": "0",
            "MinStop": "0",
            "MinPark": "0",
            "MinSat": "0",
            "MaxDistanceMSG": "0",
            "MinTripTime": "0",
            "MinTripDistance": "0",
            "FuelConsumption_SummerRate": "0",
            "FuelConsumption_WinterRate": "0",
            "AddToWasl": false,
            "BusinessTypeTransportation": false,
            "BusinessTypeWater": false,
            "BusinessTypeHajj": false,
            "vehiclePlate": vehiclePlate.dictionary,
            "Icon": "DefaultCarIcon.png"
        ]
    }
}

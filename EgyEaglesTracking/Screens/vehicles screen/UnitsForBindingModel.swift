//
//  UnitsForBindingModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 21/06/2024.
//

import Foundation

struct UnitsForBindingModel: Codable {
    let id, imei, customerID: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case imei = "IMEI"
        case customerID = "CustomerId"
    }
}

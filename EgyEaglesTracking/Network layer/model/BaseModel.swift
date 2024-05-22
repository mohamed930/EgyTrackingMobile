//
//  BaseModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let statusCode: Int
    let success: Bool
    let message: String
    let data: T?

    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case success = "Success"
        case message = "Message"
        case data = "Data"
    }
}

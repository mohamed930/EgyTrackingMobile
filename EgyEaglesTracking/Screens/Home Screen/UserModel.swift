//
//  UserModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 29/05/2024.
//

import Foundation

struct UserModel: Codable {
    let firstName, lastName: String
    let claims: [Claim]

    enum CodingKeys: String, CodingKey {
        case firstName = "FirstName"
        case lastName = "LastName"
        case claims = "Claims"
    }
}

// MARK: - Claim
struct Claim: Codable {
    let value: String

    enum CodingKeys: String, CodingKey {
        case value = "Value"
    }
}

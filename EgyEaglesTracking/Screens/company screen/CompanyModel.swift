//
//  CompanyModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import Foundation

struct CompanyResponse: Codable {
    let result: [CompanyModel]
}

struct CompanyModel: Identifiable , Codable {
    var id = UUID()
    let companyName: String
    let customersContractNumber: String?
    let upLevelID, emailAddress: String
    let inActive: Bool
    let comments: String?
    let phoneNumber: String
    let adminID, commercialRecordIssueDateHijri: String?
    let managerPhoneNumber, customerType: String
    let address: String?
    let priority: Int
    let companyType, cid: String
    let contractNumber, commercialRecordNumber: String?
    let managerName: String
    let consuming, contractEndDate: String?
    let managerMobileNumber: String
    let waslID: String?
    let identityNumber: String
    let dateOfBirth: String?

    enum CodingKeys: String, CodingKey {
        case companyName = "CompanyName"
        case customersContractNumber = "CustomersContractNumber"
        case upLevelID = "UpLevelId"
        case emailAddress = "EmailAddress"
        case inActive = "InActive"
        case comments = "Comments"
        case phoneNumber = "PhoneNumber"
        case adminID = "AdminId"
        case commercialRecordIssueDateHijri = "CommercialRecordIssueDateHijri"
        case managerPhoneNumber = "ManagerPhoneNumber"
        case customerType = "CustomerType"
        case address = "Address"
        case priority
        case companyType = "CompanyType"
        case cid = "Id"
        case contractNumber = "ContractNumber"
        case commercialRecordNumber = "CommercialRecordNumber"
        case managerName = "ManagerName"
        case consuming = "Consuming"
        case contractEndDate = "ContractEndDate"
        case managerMobileNumber = "ManagerMobileNumber"
        case waslID = "WaslId"
        case identityNumber = "IdentityNumber"
        case dateOfBirth = "DateOfBirth"
    }
}

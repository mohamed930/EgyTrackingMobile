//
//  CustomerModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 04/06/2024.
//

import Foundation

struct NewAdmin: Codable {
    let email: String = "info@egyeagles.com"
    let password: String = "Aa_123@@@"
    let firstName: String = "sss"
    let lastName: String = "sss"
    let isDealer: Bool = true

    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case password = "Password"
        case firstName = "FirstName"
        case lastName = "LastName"
        case isDealer = "IsDealer"
    }
    
    var dictionary: [String: Any] {
        return [
            "Email": email,
            "Password": password,
            "FirstName": firstName,
            "LastName": lastName,
            "IsDealer": isDealer
        ]
    }
}

struct CustomerModel: Codable {
    var Id: String?
    let customerType: String
    let companyName: String
    let companyType: String
    let identityNumber: String
    let commercialRecordNumber: String?
    let commercialRecordIssueDateHijri: String?
    let dateOfBirth: String
    let isHigri: Bool
    let phoneNumber: String
    let extensionNumber: String?
    let emailAddress: String
    let managerName: String?
    let managerPhoneNumber: String?
    let managerMobileNumber: String?
    let address: String
    let priority: Int = 3
    let consuming: String = ""
    let comments: String = ""
    let contractNumber: String = ""
    let customersContractNumber: String = ""
    let contractEndDate: String = ""
    var adminId: String = "f4346b776beb40ba97d7fcc85ef0197c"
    var upLevelId: String = "6649dac4db129a313fec74e6"
    let addToWasl: Bool
    let xapiKey: String
    let newAdmin: NewAdmin

    enum CodingKeys: String, CodingKey {
        case Id
        case customerType = "CustomerType"
        case companyName = "CompanyName"
        case companyType = "CompanyType"
        case identityNumber = "IdentityNumber"
        case commercialRecordNumber = "CommercialRecordNumber"
        case commercialRecordIssueDateHijri = "CommercialRecordIssueDateHijri"
        case dateOfBirth = "DateOfBirth"
        case isHigri = "IsHigri"
        case phoneNumber = "PhoneNumber"
        case extensionNumber = "ExtensionNumber"
        case emailAddress = "EmailAddress"
        case managerName = "ManagerName"
        case managerPhoneNumber = "ManagerPhoneNumber"
        case managerMobileNumber = "ManagerMobileNumber"
        case address = "Address"
        case priority = "priority"
        case consuming = "Consuming"
        case comments = "Comments"
        case contractNumber = "ContractNumber"
        case customersContractNumber = "CustomersContractNumber"
        case contractEndDate = "ContractEndDate"
        case adminId = "AdminId"
        case upLevelId = "UpLevelId"
        case addToWasl = "AddToWasl"
        case xapiKey = "XapiKey"
        case newAdmin = "NewAdmin"
    }
    
    var dictionary: [String: Any] {
        var dict: [String: Any] = [
            "CustomerType": customerType,
            "CompanyName": companyName,
            "CompanyType": companyType,
            "IdentityNumber": identityNumber,
            "DateOfBirth": dateOfBirth,
            "IsHigri": isHigri,
            "PhoneNumber": phoneNumber,
            "EmailAddress": emailAddress,
            "Address": address,
            "priority": priority,
            "Consuming": consuming,
            "Comments": comments,
            "ContractNumber": contractNumber,
            "CustomersContractNumber": customersContractNumber,
            "ContractEndDate": contractEndDate,
            "AdminId": adminId,
            "UpLevelId": upLevelId,
            "AddToWasl": addToWasl,
            "XapiKey": xapiKey,
            "NewAdmin": newAdmin.dictionary
        ]
        
        if let commercialRecordNumber = commercialRecordNumber {
            dict["CommercialRecordNumber"] = commercialRecordNumber
        }
        
        if let commercialRecordIssueDateHijri = commercialRecordIssueDateHijri {
            dict["CommercialRecordIssueDateHijri"] = commercialRecordIssueDateHijri
        }
        
        if let extensionNumber = extensionNumber {
            dict["ExtensionNumber"] = extensionNumber
        }
        
        if let managerName = managerName {
            dict["ManagerName"] = managerName
        }
        
        if let managerPhoneNumber = managerPhoneNumber {
            dict["ManagerPhoneNumber"] = managerPhoneNumber
        }
        
        if let managerMobileNumber = managerMobileNumber {
            dict["ManagerMobileNumber"] = managerMobileNumber
        }
        
        if let Id = Id {
            dict["Id"] = Id
        }
        
        return dict
    }
}


struct companyUpdateModel: Codable {
    let companyName: String
    let extensionNumber: String?
    let customersContractNumber, upLevelID, emailAddress: String
    let inActive: Bool
    let comments, phoneNumber, adminID: String
    let commercialRecordIssueDateHijri, managerPhoneNumber: String?
    let customerType, address: String
    let priority: Int
    let companyType, id, contractNumber: String
    let commercialRecordNumber, managerName: String?
    let consuming, contractEndDate: String
    let managerMobileNumber, waslID: String?
    let identityNumber, dateOfBirth: String

    enum CodingKeys: String, CodingKey {
        case companyName = "CompanyName"
        case extensionNumber = "ExtensionNumber"
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
        case id = "Id"
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

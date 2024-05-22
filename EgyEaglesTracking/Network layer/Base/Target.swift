//
//  Target.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum TaskOperation {
    case requestPlain
    case requestParameters(parameters : [String:Any])
}

protocol TargetType {
    var baseURL: Api { get }
    var path: Api { get }
    var method: HTTPMethod { get }
    var task: TaskOperation { get }
    var headers: [String:String]? { get }
}

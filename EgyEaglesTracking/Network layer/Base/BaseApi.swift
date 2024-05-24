//
//  BaseApi.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 22/05/2024.
//

import SwiftUI

class BaseAPI<T:TargetType> {
    func fetchData<M: Decodable>(Target: T) async throws -> M {
        let endpoint = (Target.baseURL.rawValue + Target.path.rawValue)
        
        guard let url = URL(string: endpoint) else { throw ErrorMessage.invalidUrl }
        
        var request = URLRequest(url: url)
        request.httpMethod = Target.method.rawValue
        
        if let header = Target.headers, header != [:] {
            // Add the headers to the request
            for (key, value) in header {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = buildParams(task: Target.task)
        
        if !params.isEmpty {
            do {
                // Convert the payload to JSON data
                let jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
                request.httpBody = jsonData
                print("Request body: \(String(data: jsonData, encoding: .utf8) ?? "")")
            } catch {
                throw ErrorMessage.invalidParameters
            }
        }
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // MARK: - Debug
        // -------------------------------------------
        debugJson(data: data)
        // MARK: - EndDebug
        // -------------------------------------------
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(M.self, from: data)
            }
            catch {
                throw ErrorMessage.invalidResponse
            }
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(M.self, from: data)
        }
        catch {
            throw ErrorMessage.invalidData
        }
    }
    
    private func buildParams(task: TaskOperation) -> [String:Any] {
        switch task {
        case .requestPlain:
            return [:]
        case .requestParameters(let parameters):
            return parameters
        }
    }
    
    private func debugJson(data: Data) {
        print("Body:")
        print("-----------------------")
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            if let prettyString = String(data: prettyData, encoding: .utf8) {
                print(prettyString)
                print("------------------")
            }
        } catch {
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                print(string)
            }
        }
    }
    
    
    func fetchUserToken() -> String {
        @AppStorage("token") var token = ""
        
        return token
    }
}

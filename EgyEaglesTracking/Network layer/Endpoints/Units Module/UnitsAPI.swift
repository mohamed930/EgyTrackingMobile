//
//  UnitsAPI.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 21/06/2024.
//

import Foundation

protocol UnitsAPIProtocol {
    func fetchUnitsForBinding() async throws -> BaseModel<[UnitsForBindingModel]>
}

class UnitsAPI: BaseAPI<UnitsNetworking>, UnitsAPIProtocol {
    
    func fetchUnitsForBinding() async throws -> BaseModel<[UnitsForBindingModel]> {
        try await fetchData(Target: .unitForBinding(token: self.fetchUserToken()))
    }
    
    
}

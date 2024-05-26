//
//  CarsModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import Foundation

struct CarsModel: Identifiable {
    let id = UUID()
    let carType: String
    let carNumber: String
    let carYearModel: String
    let speed: Double
    let status: Bool
}

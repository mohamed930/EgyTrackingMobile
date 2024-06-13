//
//  VehicleViewModel.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 13/06/2024.
//

import SwiftUI

class VehicleViewModel: ObservableObject {
    @Published var data = [CarsModel]()
    @Published var count = 0
    
    var vehicleId: String = ""
    
    func fetchData() {
        let car1 = CarsModel(
            carId: "ABC123",
            inActive: false,
            vehicleModel: "Toyota Corolla",
            minSpeed: 50.0,
            vehiclePlate: VehiclePlate(number: "1234", rightLetter: "A", middleLetter: "B", leftLetter: "C"),
            manufacturingYear: "2019"
        )

        let car2 = CarsModel(
            carId: "DEF456",
            inActive: true,
            vehicleModel: "Honda Civic",
            minSpeed: 45.0,
            vehiclePlate: VehiclePlate(number: "5678", rightLetter: "D", middleLetter: "E", leftLetter: "F"),
            manufacturingYear: "2018"
        )

        let car3 = CarsModel(
            carId: "GHI789",
            inActive: false,
            vehicleModel: "Ford Focus",
            minSpeed: 55.0,
            vehiclePlate: VehiclePlate(number: "9012", rightLetter: "G", middleLetter: "H", leftLetter: "I"),
            manufacturingYear: "2020"
        )

        let car4 = CarsModel(
            carId: "JKL012",
            inActive: true,
            vehicleModel: "Chevrolet Malibu",
            minSpeed: 60.0,
            vehiclePlate: VehiclePlate(number: "3456", rightLetter: "J", middleLetter: "K", leftLetter: "L"),
            manufacturingYear: "2021"
        )

        
        data = [car1,car2,car3,car4]
        count = data.count
    }
}

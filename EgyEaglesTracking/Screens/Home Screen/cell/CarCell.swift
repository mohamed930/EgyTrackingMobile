//
//  CarCell.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import SwiftUI

struct CarCell: View {
    
    @State var model: CarsModel
    
    var body: some View {
        ZStack {
            HStack {
                HStack(spacing: 12) {
                    Image("CarLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        
                    VStack(alignment: .leading,spacing: 4) {
                        
                        HStack(spacing: 4) {
                            Text("\(model.vehicleModel)")
                                .font(.system(size: 14,weight: .medium))
                            
                            Text("|")
                                .font(.system(size: 14,weight: .medium))
                            
                            Text("\(model.vehiclePlate.number + " " + model.vehiclePlate.rightLetter + " " + model.vehiclePlate.middleLetter + " " + model.vehiclePlate.leftLetter)")
                                .font(.system(size: 14,weight: .medium))
                            
                            HStack(spacing: 4) {
                                Text("|")
                                    .font(.system(size: 14,weight: .medium))
                                
                                Text("\(model.manufacturingYear ?? "")")
                                    .font(.system(size: 14,weight: .medium))
                            }
                            .hidden(buildCondition())
                        }
                        
                        
                        
                        Text("\(model.minSpeed, specifier: "%.1f") KM/H")
                            .font(.system(size: 12,weight: .medium))
                    }
                }
                
                
                
                VStack(spacing: 5) {
                    Button {
                        print("No")
                    } label: {
                        Circle()
                            .foregroundColor(model.inActive ? .green : .red)
                            .frame(width: 15,height: 15)
                    }
                    
                    Text("tap to track it ->")
                        .foregroundColor(Color("#AAAAAA"))
                        .font(.system(size: 14,weight: .medium))
                    

                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20.0)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("#AAAAAA"), lineWidth: 1)
                    .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
            )
        }
        
        
    }
    
    private func buildCondition() -> Bool {
        if let year = model.manufacturingYear, !year.isEmpty {
            return false
        }
        else {
            return true
        }
    }
}

struct CarCell_Previews: PreviewProvider {
    
    static var previews: some View {
        CarCell(model: CarsModel(carId: "1",
                                 inActive: false,
                                 vehicleModel: "مرسيدس",
                                 minSpeed: 0,
                                 vehiclePlate: VehiclePlate(number: "123",
                                            rightLetter: "A",
                                            middleLetter: "V",
                                            leftLetter: "F")
                                 ,
                                 manufacturingYear: "2020"))
    }
}

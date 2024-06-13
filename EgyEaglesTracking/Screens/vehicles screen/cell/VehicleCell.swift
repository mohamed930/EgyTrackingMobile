//
//  VehicleCell.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI

struct VehicleCell: View {
    
    @State var model: CarsModel
    
    var body: some View {
        
        ZStack {
            HStack {
                HStack(spacing: 12) {
                    Image(.carCellLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        
                    VStack(alignment: .leading,spacing: 4) {
                        
                        
                        Text("\(model.vehicleModel ?? "u\n")")
                            .font(.system(size: 14,weight: .medium))
                            .fontWeight(.bold)
                        
                        
                        HStack(spacing: 2, content: {
                            Text("Plate:")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                            
                            Text("\(model.vehiclePlate.number)\(model.vehiclePlate.leftLetter)\(model.vehiclePlate.middleLetter)\(model.vehiclePlate.rightLetter)")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                        })
                        
                        HStack(spacing: 2) {
                            
                            Text("GPS Device:")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                            
                            Text("\(model.manufacturingYear ?? "--")")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                        }
                        
                        
                    }
                }
                
                Spacer()
                
                VStack(spacing: 5) {
                    Button {
                        print("No")
                    } label: {
                        Circle()
                            .foregroundColor(model.inActive ? .green : .red)
                            .frame(width: 15,height: 15)
                    }
                    
                    Text("tap to Edit it ->")
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
}

struct VehicleCell_Previews: PreviewProvider {
    static var previews: some View {
        
        let exampleCompany = CarsModel(carId: "1",
                                       inActive: false,
                                       vehicleModel: "مرسيدس",
                                       minSpeed: 0,
                                       vehiclePlate: VehiclePlate(number: "123",
                                                  rightLetter: "A",
                                                  middleLetter: "V",
                                                  leftLetter: "F")
                                       ,
                                       manufacturingYear: "2020")
        
        VehicleCell(model: exampleCompany)
    }
}

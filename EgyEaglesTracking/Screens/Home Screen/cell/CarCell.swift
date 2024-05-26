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
                        Text("\(model.carType) | \(model.carNumber) | \(model.carYearModel)")
                            .font(.system(size: 14,weight: .medium))
                        
                        Text("\(model.speed, specifier: "%.1f") KM/H")
                            .font(.system(size: 12,weight: .medium))
                    }
                }
                
                
                
                VStack(spacing: 5) {
                    Button {
                        print("No")
                    } label: {
                        Circle()
                            .foregroundColor(model.status ? .green : .red)
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
}

struct CarCell_Previews: PreviewProvider {
    
    static var previews: some View {
        CarCell(model: CarsModel(carType: "BMW",
                                 carNumber: "123 ABC",
                                 carYearModel: "2023",
                                 speed: 23.5,
                                 status: false)
                                )
    }
}

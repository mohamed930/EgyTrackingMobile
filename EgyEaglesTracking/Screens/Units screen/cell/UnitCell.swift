//
//  UnitCell.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 13/07/2024.
//

import SwiftUI

struct UnitCell: View {
    @State var model: UnitModel
    
    var body: some View {
        
        ZStack {
            HStack {
                HStack(spacing: 12) {
                    Image(.bind)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        
                    VStack(alignment: .leading,spacing: 4) {
                        
                        
                        Text("\(model.deviceSerial)")
                            .font(.system(size: 14,weight: .medium))
                            .fontWeight(.bold)
                        
                        
                        HStack(spacing: 2, content: {
                            Text("IMEI:")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                            
                            Text("\(model.imei)")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                        })
                        
                        HStack(spacing: 2) {
                            
                            Text("Vehicle:")
                                .font(.system(size: 12,weight: .medium))
                                .foregroundColor(Color("#4B5563"))
                            
                            Text("\(model.vehicleName ?? "--")")
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
                            .foregroundColor(model.isActive ? .green : .red)
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
            .cornerRadius(16.0)
            .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 1.5) // Add shadow here
        }
        
    }
}

//#Preview {
//    UnitCell()
//}

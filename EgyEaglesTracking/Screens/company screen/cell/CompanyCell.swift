//
//  CompanyCell.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI

struct CompanyCell: View {
    
    @State var isActive: Bool = true
    
    var body: some View {
        
        ZStack {
            HStack {
                HStack(spacing: 12) {
                    Image("CarLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        
                    VStack(alignment: .leading,spacing: 4) {
                        
                        
                        Text("Company name")
                            .font(.system(size: 14,weight: .medium))
                        
                        
                        Text("Indevidual")
                            .font(.system(size: 12,weight: .medium))
                            .foregroundColor(Color("#FC68FF"))
                    }
                }
                
                Spacer()
                
                VStack(spacing: 5) {
                    Button {
                        print("No")
                    } label: {
                        Circle()
                            .foregroundColor(isActive ? .green : .red)
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

struct CompanyCell_Previews: PreviewProvider {
    static var previews: some View {
        CompanyCell()
    }
}

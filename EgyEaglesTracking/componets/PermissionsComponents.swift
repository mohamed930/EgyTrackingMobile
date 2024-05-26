//
//  PermissionsComponents.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import SwiftUI

struct PermissionsComponents: View {
    
    var image: String
    var title: String
    var action: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30)
                
                Text(title)
                    .font(.system(size: 16,weight: .medium))
                    .foregroundColor(.black)
                
                Spacer()
                
                Image("Arrow")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24)
            }
            .padding([.top],20)
            .padding([.leading,.trailing],30)
            
            Divider()
        }
        .frame(height: 42)
        .onTapGesture {
            action()
        }
    }
}

struct PermissionsComponents_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsComponents(image: "company",
                              title: "Company",
                              action: {})
    }
}

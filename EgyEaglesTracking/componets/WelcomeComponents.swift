//
//  WelcomeComponents.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import SwiftUI

struct WelcomeComponents: View {
    
    var action: () -> ()
    
    var body: some View {
        HStack {
            Image("EgyEaglesHome")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .padding(.trailing,12)
                .onTapGesture {
                    action()
                }
            
            VStack(alignment: .leading) {
                Text("Welcome,")
                    .fontWeight(.medium)
                    .foregroundColor(Color("#8E8E8E"))
                    .font(.system(size: 12,weight: .medium))
                    .multilineTextAlignment(.leading)
                
                Text("Mohamed Ali")
                    .font(.system(size: 14,weight: .medium))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        } // MARK: - The Image & Text
    }
}

struct WelcomeComponents_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeComponents(action: {})
    }
}

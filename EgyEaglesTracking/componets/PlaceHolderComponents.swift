//
//  PlaceHolderComponents.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 28/05/2024.
//

import SwiftUI

struct PlaceHolderComponents: View {
    
    var imge: String
    var title: String
    var message: String
    
    var body: some View {
        VStack(spacing: 32) {
            Image(imge)
                .resizable()
                .scaledToFit()
                .frame(width: 231)
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Text(message)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color("#AAAAAA"))
            }
        }
    }
}

struct PlaceHolderComponents_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolderComponents(imge: "CarPlaceHolder",
                              title: "There is no cars",
                              message: "Please, add vehicle to track it")
    }
}

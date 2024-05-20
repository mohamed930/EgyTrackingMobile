//
//  TextFieldComponets.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI

struct TextFieldComponets: View {
    
    @State var email: String = ""
    @FocusState var isFocused: Bool
    
    var placeHolder: String
    var image: String
    
    var body: some View {
        
        ZStack {
            
            HStack {
                Image(image)
                
                Spacer()
            }
            .padding([.horizontal],30)
            .offset(y: -4)
            
            TextField(placeHolder,text: self.$email)
                .frame(height: 46)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 56)
                .cornerRadius(23)
                .overlay(RoundedRectangle(cornerRadius: 23).stroke(Color("#B1B1B1")))
                .padding([.horizontal], 10)
                .padding([.bottom], 8)
                .font(.system(size: 16,weight: .medium))
                .focused($isFocused)
            
            
        } // MARK: - TextField
        
    }
}

struct TextFieldComponets_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponets(placeHolder: "Email", image: "Email")
    }
}

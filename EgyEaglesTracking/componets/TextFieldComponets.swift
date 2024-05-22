//
//  TextFieldComponets.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI

struct TextFieldComponets: View {
    
    @Binding var email: String
    @FocusState var isFocused: Bool
    @Binding var errorMessage: Bool
    
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
            
            TextField(placeHolder,text: self.$email,onEditingChanged: { isEditing in
                if !errorMessage {
                    errorMessage.toggle()
                }
            })
                .frame(height: 46)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 56)
                .cornerRadius(23)
                .overlay(RoundedRectangle(cornerRadius: 23).stroke(errorMessage ? Color("#B1B1B1") : .red))
                .padding([.horizontal], 10)
                .padding([.bottom], 8)
                .font(.system(size: 16,weight: .medium))
                .focused($isFocused)
            
            
        } // MARK: - TextField
        
    }
}

struct TextFieldComponets_Previews: PreviewProvider {
    
    @State static var email = "Email"
    @State static var error = true
    
    static var previews: some View {
        TextFieldComponets(email: $email, errorMessage: $error, placeHolder: "Email", image: "Email")
    }
}

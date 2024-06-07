//
//  InputComponents.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 31/05/2024.
//

import SwiftUI

struct InputComponents: View {
    
    @Binding var text: String
    @FocusState var isFocused: Bool
    
    @State var labelText: String
    @State var isNotRequired: Bool = true
    @State var isNotChooceTextField: Bool = true
    @State var keyboardType: UIKeyboardType = .default
    
    @State var errorBorder: Bool = false
    
    
    var body: some View {
        
        VStack {
            HStack(spacing: 5) {
                Text(labelText)
                    .font(.system(size: 12))
                    .foregroundColor(Color("#A2A2A2"))
                
                Text("*")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .hidden(isNotRequired)
                
                Spacer()
                
            }
            
            TextField("",text: $text)
                .frame(height: 38)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 20)
                .cornerRadius(23)
                .overlay(RoundedRectangle(cornerRadius: 23).stroke(errorBorder ? .red: Color("#E8E8E8")))
                .padding([.bottom], 8)
                .font(.system(size: 16,weight: .medium))
                .focused($isFocused)
                .keyboardType(keyboardType)
                .overlay {
                    HStack {
                        Spacer()
                        
                        Image("downIndecator")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26)
                            .padding([.bottom], 4)
                        
                        Text("")
                        Text("")
                        Text("")
                    }
                    .hidden(isNotChooceTextField)
                }
            
        }
        .padding()
        .padding([.bottom,.top],-10)
        .listRowInsets(EdgeInsets()) // Remove default padding
        .listRowSeparator(.hidden)
        
    }
}

struct InputComponents_Previews: PreviewProvider {
    
    @State static var email = ""
    
    static var previews: some View {
        InputComponents(text: $email, labelText: "Company name", errorBorder: true)
    }
}

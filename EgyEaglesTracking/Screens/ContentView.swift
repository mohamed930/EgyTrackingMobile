//
//  ContentView.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Image("EgyEagles")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding([.top], 96)
                .padding([.bottom],50)
            
            ZStack {
                HStack {
                    Image("Email")
                    
                    Spacer()
                }
                .padding([.horizontal],30)
                .offset(y: -4)
                
                TextField("Email",text: self.$email)
                    .frame(height: 46)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 56)
                    .cornerRadius(23)
                    .overlay(RoundedRectangle(cornerRadius: 23).stroke(Color("#B1B1B1")))
                    .padding([.horizontal], 10)
                    .padding([.bottom], 8)
                    .font(.system(size: 16,weight: .medium))
            }
            
            
            ZStack {
                HStack {
                    Image("password")
                    
                    Spacer()
                }
                .padding([.horizontal],30)
                .offset(y: 0)
                
                SecureField("Password",text: self.$email)
                    .frame(height: 46)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 56)
                    .cornerRadius(23)
                    .overlay(RoundedRectangle(cornerRadius: 23).stroke(Color("#B1B1B1")))
                    .padding([.horizontal], 10)
                    .font(.system(size: 16,weight: .medium))
            }
            
            
            VStack {
                
                Spacer()
                
                Button {
                    print("Hello World!!")
                } label: {
                    Text("Login")
                        .padding()
                        .frame(width: screenWidth - (37*2))
                }
                .frame(height: 46)
                .background(Color("#239C6F"))
                .foregroundColor(.white)
                .font(.system(size: 16,weight: .medium))
                .clipShape(Capsule())

            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

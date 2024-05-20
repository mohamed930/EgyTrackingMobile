//
//  ContentView.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isPasswordVisible = true
    @FocusState private var focusedField: Field?
    
    @State var ErrorMessage: Bool = true
    
    enum Field: Hashable {
        case email
        case password
    }
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            
            Color.white.opacity(0.0000001)
            
            VStack {
                Image("EgyEagles")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding([.top], 96)
                    .padding([.bottom],50)
                
                TextFieldComponets(email: email, placeHolder: "Email", image: "Email")
                    .submitLabel(.next)
                    .focused($focusedField, equals: .email)
                    .onSubmit {
                        focusedField = .password
                    }
                
                
                ZStack {
                    Group {
                        // case the secure password view
                        if isPasswordVisible {
                            
                            HStack {
                                Image("password")
                                
                                Spacer()
                            }
                            .padding([.horizontal],30)
                            .offset(y: 0)
                            // MARK: - password icon
                            
                            SecureField("Password",text: self.$password)
                                .frame(height: 46)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.horizontal], 56)
                                .cornerRadius(23)
                                .overlay(RoundedRectangle(cornerRadius: 23).stroke(Color("#B1B1B1")))
                                .padding([.horizontal], 10)
                                .font(.system(size: 16,weight: .medium))
                                .focused($focusedField, equals: .password)
                                .onSubmit {
                                    focusedField = .none
                                }
                                .submitLabel(.done)
                        }
                        // case to see password as plain text
                        else {
                            TextFieldComponets(email: password, placeHolder: "Password", image: "password")
                                .focused($focusedField, equals: .password)
                                .onSubmit {
                                    focusedField = .none
                                }
                                .submitLabel(.done)
                        }
                    }
                    // MARK: - password TextField
                    
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // Toggle password visibility
                            self.isPasswordVisible.toggle()
                        }) {
                            Image(systemName: self.isPasswordVisible ? "eye.slash" : "eye")
                                .padding(.trailing, 20)
                                .foregroundColor(Color.green)
                        }
                        
                        
                    }
                    .padding([.horizontal], 21)
                        .frame(height: 46)
                        .offset(y: isPasswordVisible ? 0 : -4)
                    
                    // MARK: - Eye button
                } // MARK: - password TextField
                
                HStack {
                    Text("Username or password isn’t correct")
                        .font(.system(size: 12,weight: .medium))
                    .foregroundColor(.red)
                    
                    Spacer()
                }
                .padding([.horizontal],18)
                .padding([.top],4)
                .hidden(ErrorMessage)
                
                
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

                } // MARK: - Button
                
                Spacer()
                
            } // MARK: - VStack
            .padding()
        .ignoresSafeArea(.keyboard, edges: .bottom)
        } // MARK: - ZSrack
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

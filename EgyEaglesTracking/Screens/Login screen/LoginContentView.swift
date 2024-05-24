//
//  LoginContentView.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI
import Combine

struct LoginContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isPasswordVisible = true
    @FocusState private var focusedField: Field?
    
    @State var isButtonTapped: Bool = false
    @State var ErrorMessage: Bool = true
    @State var isloading: Bool = false

    @State var shouldNavigate: Bool = false
    
    @StateObject var viewmodel = LoginViewModel()
    
    enum Field: Hashable {
        case email
        case password
    }
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenhight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color.white.opacity(0.0000001)
                
                VStack {
                    Image("EgyEagles")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .padding([.top], 96)
                        .padding([.bottom],50)
                    
                    TextFieldComponets(email: $email, errorMessage: $ErrorMessage, placeHolder: "Email", image: "Email")
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
                                .offset(y: -4)
                                // MARK: - password icon
                                
                                SecureField("Password",text: self.$password)
                                    .frame(height: 46)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding([.horizontal], 56)
                                    .cornerRadius(23)
                                    .overlay(RoundedRectangle(cornerRadius: 23).stroke(ErrorMessage ?  Color("#B1B1B1") : .red))
                                    .padding([.horizontal], 10)
                                    .padding([.bottom], 8)
                                    .font(.system(size: 16,weight: .medium))
                                    .focused($focusedField, equals: .password)
                                    .onSubmit {
                                        focusedField = .none
                                    }
                                    .submitLabel(.done)
                            }
                            // case to see password as plain text
                            else {
                                TextFieldComponets(email: $password, errorMessage: $ErrorMessage, placeHolder: "Password", image: "password")
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
                            .offset(y: -4)
                        
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
                            
                            self.endTextEditing()
                            self.isloading.toggle()
                            
                            Task {
                                await viewmodel.login(username: email, password: password)
                                
                                self.isloading.toggle()
                                
                                guard let islogin = viewmodel.islogin else { return }
                                
                                if islogin {
                                    shouldNavigate.toggle()
                                }
                                else {
                                    ErrorMessage.toggle()
                                }
                            }
                            
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
                        .opacity((email != "" && password != "") ? 1 : 0.5 )
                        .disabled((email != "" && password != "") ? false : true )

                    } // MARK: - Login Button
                    NavigationLink("", destination: HomeScreen(),isActive: $shouldNavigate)
                    
                    Spacer()
                    
                } // MARK: - VStack
                .padding()
                
                LoaderIndecatorComponets(isloading: $isloading)
                
            } // MARK: - ZSrack
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onTapGesture {
                self.endTextEditing()
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}

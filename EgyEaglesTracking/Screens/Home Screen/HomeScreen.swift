//
//  HomeScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var isActive: Bool = false
    @State var backToLogin: Bool = false
    
    @State var isloading: Bool = false
    
    @State var moveToProfile: Bool = false
    
    @StateObject var viewmodel = HomeViewModel()
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                VStack {
                    
                    // Header View.
                    HStack {
                        
                        WelcomeComponents(str: viewmodel.username) {
                            moveToProfile.toggle()
                        }
                        NavigationLink("", destination: ProfileScreen(name: viewmodel.username), isActive: $moveToProfile)// MARK: - The Image & Text
                        
                        
                        Button {
                            // MARK: - Action button.
                            isActive.toggle()
                            
                        } label: {
                            Image("logout")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                        }
                        .frame(width: 30,height: 30)

                        
                    } // MARK: - HStack
                    .padding(32)
                    .frame(height: 100)
                    
                    Group {
                        
                        if let count = viewmodel.numberOfCars {
                            if count != "0" {
                                // Number of cars.
                                HStack {
                                    HStack {
                                        Text("Your cars")
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                    }
                                    
                                    Text("\(viewmodel.numberOfCars ?? "")")
                                        .font(.system(size: 14))
                                        .fontWeight(.medium)
                                    
                                    Text("cars found")
                                        .font(.system(size: 14))
                                        .fontWeight(.medium)
                                }
                                .padding([.leading,.trailing],32)
                                
                                // List of cars.
                                List(viewmodel.carArray) { car in
                                    CarCell(model: car)
                                        .listRowSeparator(.hidden)
                                        .listRowInsets(EdgeInsets()) // Remove default padding
                                        .padding([.horizontal],15)
                                        .padding([.top,.bottom],10)
                                        .buttonStyle(PlainButtonStyle())
                                }
                                .listStyle(PlainListStyle())
                            }
                            else {
                                
                                Spacer()
                                
                                PlaceHolderComponents(imge: "CarPlaceHolder",
                                                      title: "There is no cars",
                                                      message: "Please, add vehicle to track it")
                                
                                Spacer()
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                } // MARK: - VStack
                
                if isActive {
                    
                    NavigationLink(destination: LoginContentView(), isActive: $backToLogin) {
                        customAlert(isActive: $isActive,
                                    imge: "logoutRed",
                                    title: "Logout of app",
                                    message: "Are you sure to want logout from app ?",
                                    buttonTitle: "Logout") {
                            // logout
                            
                            
                            isloading.toggle()
                            
                            Task {
                                let response = await viewmodel.logout()
                                
                                isloading.toggle()
                                
                                if response {
                                    viewmodel.removeToken()
//                                    backToLogin.toggle()
                                    presentationMode.wrappedValue.dismiss()
                                }
                                
                            }
                            
                            
                        }
                    }
                }
                
                
                if isloading {
                    LoaderIndecatorComponets(isloading: $isloading)
                        .ignoresSafeArea(.all)
                        .frame(maxHeight: .infinity)
                }
                
                if backToLogin {
                     NavigationLink("", destination: LoginContentView(), isActive: $backToLogin)
                }
                
            } // MARK: - ZStack
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $viewmodel.loginAgain) {
            Alert(title: Text("Seasion expired"), message: Text("Plase, login again"), dismissButton: .cancel(Text("Login"), action: {
                viewmodel.removeToken()
                backToLogin.toggle()
            }) )

        }
        .task {
            isloading = true
            
            let repsonse = await viewmodel.fetchCarsOperation()
            await viewmodel.fetchUserInfo()
            
            if repsonse {
                isloading = false
            }
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

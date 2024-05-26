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
    
    @StateObject var viewmodel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                VStack {
                    
                    // Header View.
                    HStack {
                        
                        HStack {
                            Image("EgyEaglesHome")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .padding(.trailing,12)
                            
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
                    
                    // Number of cars.
                    HStack {
                        HStack {
                            Text("Your cars")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        
                        Text("3")
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
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                } // MARK: - VStack
                
                if isActive {
                    customAlert(isActive: $isActive,
                                imge: "logoutRed",
                                title: "Logout of app",
                                message: "Are you sure to want logout from app ?",
                                buttonTitle: "Logout") {
                        // logout
                        
                        
                        isloading.toggle()
                        
                        Task {
                            let response = await viewmodel.logout()
                            
                            if response {
                                isloading.toggle()
                                viewmodel.removeToken()
                                backToLogin.toggle()
                            }
                        }
                        
                        
                    }
                    NavigationLink("", destination: LoginContentView(), isActive: $backToLogin)
                }
                
                
                if isloading {
                    LoaderIndecatorComponets(isloading: $isloading)
                }
                
            } // MARK: - ZStack
            
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            let cars = [
                    CarsModel(carType: "BMW", carNumber: "123 ABC", carYearModel: "2023", speed: 23.5, status: false),
                    CarsModel(carType: "Audi", carNumber: "456 DEF", carYearModel: "2022", speed: 56.7, status: true),
                    CarsModel(carType: "Tesla", carNumber: "789 GHI", carYearModel: "2021", speed: 78.9, status: false)
                ]
            
            viewmodel.carArray = cars
        }
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

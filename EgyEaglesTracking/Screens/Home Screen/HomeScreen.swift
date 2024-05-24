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
                    
                    // Header View
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
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

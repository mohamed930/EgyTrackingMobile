//
//  CompanyScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI


struct CompanyScreen: View {
    
    @State var isloading: Bool = false
    @State var listOfCompanies = Array<CompanyModel>()
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // Screen Body
                VStack {
                    
                    // 1. navigation View
                    NavigationComponets(text: "Companies",isHidden: false) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding([.bottom],32)
                    
                    // 2. you found.
                    HStack {
                        HStack {
                            Text("Your companies")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        
                        Text("3")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("company found")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                    }
                    .padding([.leading,.trailing],16)
                    
                    
                    // 3. list of companies.
                    List(listOfCompanies) { str in
                        CompanyCell()
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets()) // Remove default padding
                            .padding([.horizontal],15)
                            .padding([.top,.bottom],10)
                            .buttonStyle(PlainButtonStyle())
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Spacer()
                } // MARK: - VStack
                
                
                // loading indecator
                if isloading {
                    LoaderIndecatorComponets(isloading: $isloading)
                }
            } // MARK: - ZStack
        } // MARK: - NavigationView
        .navigationBarBackButtonHidden(true)
        .onAppear {
            listOfCompanies = [
                                CompanyModel(name: ""),
                                CompanyModel(name: ""),
                                CompanyModel(name: ""),
                                CompanyModel(name: "")
                              ]
        }
        
        
    }
}

struct CompanyScreen_Previews: PreviewProvider {
    static var previews: some View {
        CompanyScreen()
    }
}

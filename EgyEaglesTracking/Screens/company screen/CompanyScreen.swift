//
//  CompanyScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI


struct CompanyScreen: View {
    
    @StateObject var viewmodel = CompanyViewModel()
    
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
                    
                    
                    Group {
                        if viewmodel.count == "0" {
                            Spacer()
                            Spacer()
                            PlaceHolderComponents(imge: "noDataFound", title: "There is no Companies", message: "Please, add Companies to edit it")
                            Spacer()
                            Spacer()
                        }
                        else {
                            // 2. you found.
                            HStack {
                                HStack {
                                    Text("Your companies")
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                
                                Text("\(viewmodel.count)")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                
                                Text("company found")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                            }
                            .padding([.leading,.trailing],16)
                            
                            
                            // 3. list of companies.
                            List(viewmodel.companies) { str in
                                CompanyCell(model: str)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets()) // Remove default padding
                                    .padding([.horizontal],15)
                                    .padding([.top,.bottom],10)
                                    .buttonStyle(PlainButtonStyle())
                                    .swipeActions {
                                        Button(role: .destructive) {
                                                                    // add action to button.
                                                                } label: {
                                                                    Label("Delete", systemImage: "trash")
                                                                }
                                    }
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                    
                    Spacer()
                } // MARK: - VStack
                
                
                // loading indecator
                if viewmodel.isloading {
                    LoaderIndecatorComponets(isloading: $viewmodel.isloading)
                }
            } // MARK: - ZStack
        } // MARK: - NavigationView
        .navigationBarBackButtonHidden(true)
        .task {
            await viewmodel.fetchCompanies()
        }
        
        
    }
}

struct CompanyScreen_Previews: PreviewProvider {
    static var previews: some View {
        CompanyScreen()
    }
}

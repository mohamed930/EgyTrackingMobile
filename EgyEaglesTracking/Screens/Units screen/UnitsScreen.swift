//
//  UnitsScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 23/06/2024.
//

import SwiftUI

struct UnitsScreen: View {
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewmodel = UnitViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    NavigationComponets(text: "Units",isHidden: false) {
                        presentationMode.wrappedValue.dismiss()
                    } addAction: {
                        // MARK: - Add Add Unit screen
                        
                    }
                    .padding([.bottom],32)

                    HStack {
                        HStack {
                            Text("Your Units")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        
                        Text("\(viewmodel.count)")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("units found")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                    } // MARK: - HStack
                    .padding([.leading,.trailing],24)
                    
                    
                    // 3. list of companies.
                    List(viewmodel.data) { str in
                        
                        
                        ZStack {
                            
                            UnitCell(model: str)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets()) // Remove default padding
                            .padding([.horizontal],15)
                            .padding([.top,.bottom],10)
                            .buttonStyle(PlainButtonStyle())
                            
                            
        //                    NavigationLink(destination: AddVehicleScreen(vehicleObject: str)) {
        //                        EmptyView()
        //                    }
        //                    .opacity(0)
        //                    .buttonStyle(PlainButtonStyle())
                            
                        }
                        .listStyle(PlainListStyle())
                        .listRowInsets(EdgeInsets()) // Remove default padding
                        .listRowSeparator(.hidden)
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                        .swipeActions {
                            Button(role: .destructive) {
                                 // MARK: - Add Delete Button Action.
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        
                        
                        
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    Spacer()
                }
                
                LoaderIndecatorComponets(isloading: $viewmodel.isloading)
                
            } // MARK: - ZStack.
        }
        .navigationBarBackButtonHidden()
        .onAppear(perform: {
            Task {
                await viewmodel.fetchData()
            }
        })
        
        
    }
}

#Preview {
    UnitsScreen()
}

//
//  VehiclesScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 10/06/2024.
//

import SwiftUI

struct VehiclesScreen: View {
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewmodel = VehicleViewModel()
    
    @State var alertActive: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    NavigationComponets(text: "Vehicles",isHidden: false) {
                        presentationMode.wrappedValue.dismiss()
                    } addAction: {
                        print("Move to add vehicle screen")
                    }
                    .padding([.bottom],32)
                    
                    Group {
                        if viewmodel.count != 0 {
                            // 2. you found.
                            HStack {
                                HStack {
                                    Text("Your vehicles")
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                
                                Text("\(viewmodel.count != -1 ? viewmodel.count : 0)")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                
                                Text("vehicles found")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                            }
                            .padding([.leading,.trailing],16)
                            
                            
                            // 3. list of companies.
                            List(viewmodel.data) { str in
                                
                                
                                ZStack {
                                    
                                    VehicleCell(model: str)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets()) // Remove default padding
                                    .padding([.horizontal],15)
                                    .padding([.top,.bottom],10)
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    
            //                        NavigationLink(destination: AddCompanyScreen(companyModel: str)) {
            //                            EmptyView()
            //                        }
            //                        .opacity(0)
            //                        .buttonStyle(PlainButtonStyle())
                                    
                                }
                                .listStyle(PlainListStyle())
                                .listRowInsets(EdgeInsets()) // Remove default padding
                                .listRowSeparator(.hidden)
                                .buttonStyle(PlainButtonStyle())
                                .listRowBackground(Color.clear)
                                .swipeActions {
                                    Button(role: .destructive) {
                                         alertActive.toggle()
                                         viewmodel.vehicleId = str.carId
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }

                                }
                                
                                
                                
                                
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
                    
                    
                    
                    Spacer()

                } // MARK: - VStack
                
                LoaderIndecatorComponets(isloading: $viewmodel.isloading)
                
                if alertActive {
                    customAlert(isActive: $alertActive,
                                imge: "TrashIcon",
                                title: "Delete a vehicle",
                                message: "Are you sure to want delete this vehicle?",
                                buttonTitle: "Delete") {
                        Task{
                            await viewmodel.deleteVehicle()
                        }
                    }
                }
                
                
                
            } // MARK: - ZStacl
            
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            Task {
                await viewmodel.fetchData()
            }
           
        })
    }
}

#Preview {
    VehiclesScreen()
}

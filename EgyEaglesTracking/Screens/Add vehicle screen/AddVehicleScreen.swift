//
//  AddVehicleScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 15/06/2024.
//

import SwiftUI

struct AddVehicleScreen: View {
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenhight: CGFloat = UIScreen.main.bounds.height
    
    @State var selectedFuel: Int!
    @State var selectedVehicle: Int!
    @State var vehicleName: String = ""
    @State var manufacturingYear: String = ""
    @State var vehicleModel: String = ""
    @State var vin: String = ""
    @State var seatsNumber: String = ""
    @State var chaisisNumber: String = ""
    @State var sequenceNumber: String = ""
    @State var selectedPalteType: Int!
    
    @State var vehicleNumber: String = ""
    @State var vehicleRightChar: String = ""
    @State var vehicleMiddleChar: String = ""
    @State var vehicleLeftChar: String = ""
    
    
    @State var errorBorder: Bool? = nil
    
    
    var fuelType = ["Gasoline","Diesel","Electricity","Natural Gas","Propane","Hydrogen","Biodiesel","Ethanol","Methanol","Compressed Natural Gas (CNG)","Liquefied Natural Gas (LNG)","Liquefied Petroleum Gas (LPG)","Solar Power","Hybrid","Biofuel","Jet Fuel","Kerosene","Coal"]
    
    let vehicleTypes = ["Car", "Truck", "Motorcycle", "Bicycle", "Bus", "Van", "SUV", "Boat", "Airplane", "Helicopter", "Train", "Tram", "Electric Scooter", "Skateboard", "Segway", "Jet Ski", "Snowmobile", "RV", "Moped", "Golf Cart", "Trolley", "Submarine", "Go-Kart", "Rickshaw", "Hot Air Balloon", "Spacecraft", "Monorail", "Hovercraft", "Bulldozer", "Excavator", "Ambulance", "Fire Truck", "Police Car", "Taxi", "Limousine", "Horse-drawn Carriage", "Paraglider", "Hang Glider", "Dune Buggy", "Electric Bike"]
    
    let plateTypes = ["Private Car خصوصي", "Public Transport عام نقل", "Private Transport خاص نقل", "Minibus Public حافلة صغيرة عامة", "Minibus Private حافلة صغيرة خاصة", "Taxi اجرة", "Heavy Equipment عامة أشغال", "Export تصدير", "Diplomatic دبلوماسي", "Motorcycle دراجة نارية", "Temporary مؤقت"]



    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    
                    NavigationComponets(text: "Add new vehicle") {
                        presentationMode.wrappedValue.dismiss()
                    } addAction: {}
                    .padding([.bottom],32)
                    
                    
                    List {
                        PickerView(selectedIndex: $selectedFuel, labelTitle: "Fuel type", data: fuelType)
                        
                        PickerView(selectedIndex: $selectedVehicle, labelTitle: "Vehicle type", data: vehicleTypes)
                        
                        InputComponents(text: $vehicleName, labelText: "Vehicle name", errorBorder: $errorBorder)
                        
                        InputComponents(text: $manufacturingYear, labelText: "Manufacturing Year",keyboardType: .numberPad ,errorBorder: $errorBorder)
                        
                        InputComponents(text: $vehicleModel, labelText: "Vehicle model", errorBorder: $errorBorder)
                        
                        InputComponents(text: $vin, labelText: "VIN", errorBorder: $errorBorder)
                        
                        InputComponents(text: $seatsNumber, labelText: "Seats number", keyboardType: .numberPad, errorBorder: $errorBorder)
                        
                        InputComponents(text: $chaisisNumber, labelText: "Chaisis number", errorBorder: $errorBorder)
                        
                        InputComponents(text: $sequenceNumber, labelText: "Sequence number", isNotRequired: false , keyboardType: .asciiCapableNumberPad , errorBorder: $errorBorder)
                        
                        PickerView(selectedIndex: $selectedPalteType, labelTitle: "Plate type", data: plateTypes, isnotImportant: false)
                        
                        
                        VStack {
                            
                            HStack(spacing: 5) {
                                Text("Plate Number")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("#A2A2A2"))
                                
                                Text("*")
                                    .foregroundStyle(.red)
                                
                                Spacer()
                            } // MARK: - HStack
                            .padding([.leading],20)
                            
                            HStack(spacing: 10) {
                                TextField("",text: $vehicleNumber)
                                    .keyboardType(.numberPad)
                                    .frame(width: 90, height: 32)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 1))
                                
                                TextField("ا", text: $vehicleLeftChar)
                                    .frame(width: 52, height: 49)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                                                
                                TextField("ب", text: $vehicleMiddleChar)
                                    .frame(width: 52, height: 49)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                                                
                                TextField("ت", text: $vehicleRightChar)
                                    .frame(width: 52, height: 49)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                                
                                Spacer()
                                            
                            }
                            .padding([.leading,.trailing],20)
                            
                            
                            
                        } // MARK: - VStack
                        .padding()
                        .listRowInsets(EdgeInsets()) // Remove default padding
                        .listRowSeparator(.hidden)
                        
                        
                        SendToWASLView()
                            .padding([.top],32)
                        
                        Button {
                            
                        } label: {
                            Text("Submit")
                                .padding()
                                .frame(width: screenWidth - (37))
                        }
                        .frame(height: 46)
                        .background(Color("#239C6F"))
                        .foregroundColor(.white)
                        .font(.system(size: 16,weight: .medium))
                        .clipShape(Capsule())
                        .listRowSeparator(.hidden)
                        .padding([.top],32)
//                        .opacity(validationButton() ? 1 : 0.5)
//                        .disabled(!validationButton())
                        .listRowBackground(Color.clear)
                        
                        
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Spacer()

                }
                
                
            } // MARK: - ZStack
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddVehicleScreen()
}

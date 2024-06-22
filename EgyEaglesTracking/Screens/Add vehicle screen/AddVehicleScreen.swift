//
//  AddVehicleScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 15/06/2024.
//

import SwiftUI

struct AddVehicleScreen: View {
    
    @State var vehicleObject: CarsModel?
    
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
    
    enum PlateField {
       case plateNumber1, plateNumber2, plateNumber3
   }
    
    @FocusState private var focusedField: PlateField?
    
    @StateObject var viewmodel = AddVehicleViewModel()
    
    
    @State var fuelType = ["Gasoline","Diesel","Electricity","Natural Gas","Propane","Hydrogen","Biodiesel","Ethanol","Methanol","Compressed Natural Gas (CNG)","Liquefied Natural Gas (LNG)","Liquefied Petroleum Gas (LPG)","Solar Power","Hybrid","Biofuel","Jet Fuel","Kerosene","Coal"]
    
    @State var vehicleTypes = ["Car", "Truck", "Motorcycle", "Bicycle", "Bus", "Van", "SUV", "Boat", "Airplane", "Helicopter", "Train", "Tram", "Electric Scooter", "Skateboard", "Segway", "Jet Ski", "Snowmobile", "RV", "Moped", "Golf Cart", "Trolley", "Submarine", "Go-Kart", "Rickshaw", "Hot Air Balloon", "Spacecraft", "Monorail", "Hovercraft", "Bulldozer", "Excavator", "Ambulance", "Fire Truck", "Police Car", "Taxi", "Limousine", "Horse-drawn Carriage", "Paraglider", "Hang Glider", "Dune Buggy", "Electric Bike"]
    
    @State var plateTypes = ["Private Car خصوصي", "Public Transport عام نقل", "Private Transport خاص نقل", "Minibus Public حافلة صغيرة عامة", "Minibus Private حافلة صغيرة خاصة", "Taxi اجرة", "Heavy Equipment عامة أشغال", "Export تصدير", "Diplomatic دبلوماسي", "Motorcycle دراجة نارية", "Temporary مؤقت"]



    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    
                    NavigationComponets(text: handleEditViee() ? "update a vehicle" : "Add new vehicle") {
                        presentationMode.wrappedValue.dismiss()
                    } addAction: {}
                    .padding([.bottom],32)
                    
                    
                    List {
                        PickerView(selectedIndex: $selectedFuel, labelTitle: "Fuel type", data: $fuelType)
                        
                        PickerView(selectedIndex: $selectedVehicle, labelTitle: "Vehicle type", data: $vehicleTypes)
                        
                        InputComponents(text: $vehicleName, labelText: "Vehicle name", errorBorder: $errorBorder)
                        
                        InputComponents(text: $manufacturingYear, labelText: "Manufacturing Year",keyboardType: .numberPad ,errorBorder: $errorBorder)
                        
                        InputComponents(text: $vehicleModel, labelText: "Vehicle model", errorBorder: $errorBorder)
                        
                        InputComponents(text: $vin, labelText: "VIN", errorBorder: $errorBorder)
                        
                        InputComponents(text: $seatsNumber, labelText: "Seats number", keyboardType: .numberPad, errorBorder: $errorBorder)
                        
                        InputComponents(text: $chaisisNumber, labelText: "Chaisis number", errorBorder: $errorBorder)
                        
                        InputComponents(text: $sequenceNumber, labelText: "Sequence number", isNotRequired: false , keyboardType: .asciiCapableNumberPad , errorBorder: $errorBorder)
                        
                        PickerView(selectedIndex: $selectedPalteType, labelTitle: "Plate type", data: $plateTypes, isnotImportant: false)
                        
                        
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
                                    .focused($focusedField, equals: .plateNumber1)
                                    .onChange(of: vehicleLeftChar) { newValue in
                                        if newValue.count == 1 {
                                            focusedField = .plateNumber2
                                        }
                                    }
                                                
                                TextField("ب", text: $vehicleMiddleChar)
                                    .frame(width: 52, height: 49)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                                    .focused($focusedField, equals: .plateNumber2)
                                    .onChange(of: vehicleMiddleChar) { newValue in
                                        if newValue.count == 1 {
                                            focusedField = .plateNumber3
                                        }
                                    }
                                                
                                TextField("ت", text: $vehicleRightChar)
                                    .frame(width: 52, height: 49)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 8)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                                    .focused($focusedField, equals: .plateNumber3)
                                
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
                            buildModel()
                            
                            Task {
                                await handleAction()
                            }
                            
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
                        .opacity(buildValidation() ? 1 : 0.5)
                        .disabled(!buildValidation())
                        .listRowBackground(Color.clear)
                        
                        
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Spacer()

                }
                
                
                LoaderIndecatorComponets(isloading: $viewmodel.isloading)
                
                
            } // MARK: - ZStack
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            loadData()
        }
    }
    
    
    private func buildModel() {
        
        guard let jwt = JwtDecode.shared.decode() else { return }
        
        let model = AddVehicleModel(sequenceNumber: sequenceNumber,
                                    plateType: String(selectedPalteType + 1),
                                    CustomerId: jwt.pCid,
                                    vehiclePlate: VehiclePlate(number: vehicleNumber,
                                                               rightLetter: vehicleRightChar,
                                                               middleLetter: vehicleMiddleChar,
                                                               leftLetter: vehicleLeftChar))
        
        viewmodel.model = model
        
        
    }
    
    private func buildValidation() -> Bool {
        return !sequenceNumber.isEmpty && selectedPalteType != nil && !vehicleNumber.isEmpty && !vehicleLeftChar.isEmpty && !vehicleMiddleChar.isEmpty && !vehicleRightChar.isEmpty
    }
    
    private func handleEditViee() -> Bool {
        guard vehicleObject != nil else {return false}
        return true
    }
    
    private func loadData() {
        guard let vehicleObject else { return }
        
        selectedPalteType = vehicleObject.plateType
        sequenceNumber = vehicleObject.sequenceNumber
        vehicleNumber = vehicleObject.vehiclePlate.number
        vehicleRightChar = vehicleObject.vehiclePlate.rightLetter
        vehicleMiddleChar = vehicleObject.vehiclePlate.middleLetter
        vehicleLeftChar = vehicleObject.vehiclePlate.leftLetter
        
    }
    
    private func handleAction() async {
        guard let vehicleObject else {
            
            Task {
                await viewmodel.addVehicle()
                
                guard let success = viewmodel.success else { return }
                
                if success {
                    presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(name: NSNotification.vehicleSuccess, object: nil)
                }
            }
            
            return
        }
        
        
        Task {
            await viewmodel.updateVehicle()
            
            guard let success = viewmodel.success else { return }
            
            if success {
                presentationMode.wrappedValue.dismiss()
                NotificationCenter.default.post(name: NSNotification.vehicleSuccess, object: nil)
            }
        }
        
        
    }
}

#Preview {
    AddVehicleScreen()
}

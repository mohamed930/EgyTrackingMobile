//
//  ProfileScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import SwiftUI

struct ProfileScreen: View {
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    NavigationComponets(text: "Profile" ,action:  {
                        presentationMode.wrappedValue.dismiss()
                    },addAction: {})
                    
                    WelcomeComponents(str: name,action: {})
                        .padding()
                        .padding([.leading],8)
                    
                    VStack(spacing: 16) {
                        
                        NavigationLink(destination: CompanyScreen()) {
                            PermissionsComponents(image: "company", title: "Company") {}
                                .disabled(true)
                        }
                        
                        PermissionsComponents(image: "Drivers", title: "Drivers") {
                            // move to Drivers.
                        }
                        
                        NavigationLink(destination: VehiclesScreen()) {
                            PermissionsComponents(image: "Vehicles", title: "Vehicles") {}
                                .disabled(true)
                        }
                        
                        
                        NavigationLink(destination: UnitsScreen()) {
                            PermissionsComponents(image: "unit", title: "Units") {}
                                .disabled(true)
                        }
                        
                        
                    }
                    
                    
                    
                    
                    Spacer()
                } // MARK: - VStack
            } // MARK: - ZStack
        } // MARK: - NavigationView
        .navigationBarHidden(true)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(name: "Mohamed Ali")
    }
}

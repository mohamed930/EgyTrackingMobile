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
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    NavigationComponets(text: "Profile") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    WelcomeComponents(action: {})
                        .padding()
                        .padding([.leading],8)
                    
                    VStack(spacing: 16) {
                        PermissionsComponents(image: "company", title: "Company") {
                            // move to company.
                        }
                        
                        PermissionsComponents(image: "Drivers", title: "Drivers") {
                            // move to Drivers.
                        }
                        
                        PermissionsComponents(image: "Vehicles", title: "Vehicles") {
                            // move to Vehicles.
                        }
                        
                        PermissionsComponents(image: "unit", title: "Units") {
                            // move to Vehicles.
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
        ProfileScreen()
    }
}

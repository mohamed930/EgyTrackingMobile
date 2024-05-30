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
                    })
                    
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
        ProfileScreen(name: "Mohamed Ali")
    }
}

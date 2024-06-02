//
//  EgyEaglesTrackingApp.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI

@main
struct EgyEaglesTrackingApp: App {
    
    @AppStorage("token") var token = ""
    
    var body: some Scene {
        WindowGroup {
            
            /*
             if token.isEmpty {
                 LoginContentView()
             }
             else {
                 HomeScreen()
             }
             */
            
            AddCompanyScreen()
        }
    }
}

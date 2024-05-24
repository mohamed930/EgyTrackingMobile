//
//  LoaderIndecatorComponets.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct LoaderIndecatorComponets: View {
    
    @Binding var isloading: Bool
    
    var body: some View {
        ZStack {
            VStack {
                LoadingIndicator(animation: .threeBalls, color: Color("#239C6F"), size: .large)
                
                Text("Please wait")
                    .font(.system(size: 24,weight: .medium))
                    .foregroundColor(Color("#239C6F"))
                    .padding(.top,-5)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.75))
        .hidden(!isloading)
    }
}

struct LoaderIndecatorComponets_Previews: PreviewProvider {
    
    @State static var isloading: Bool = true
    
    static var previews: some View {
        LoaderIndecatorComponets(isloading: $isloading)
    }
}

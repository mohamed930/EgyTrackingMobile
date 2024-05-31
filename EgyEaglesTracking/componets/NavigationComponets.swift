//
//  NavigationComponets.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 26/05/2024.
//

import SwiftUI

struct NavigationComponets: View {
    
    var text: String
    @State var isHidden = true
    var action: () -> ()
    var addAction: () -> ()
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 18,weight: .semibold))
                .frame(maxWidth: .infinity)
                .overlay {
                    HStack {
                        Button {
                            action()
                        } label: {
                            Image("arrowBack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                        }
                        .frame(width: 30,height: 30)
                        
                        Spacer()
                        
                        Button {
                            addAction()
                        } label: {
                            Image("addButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
                        .frame(width: 30,height: 30)
                        .hidden(isHidden)
                        .padding([.top],5)

                    }
                    .padding()
                }
        }
        .frame(height: 56)
    }
}

struct NavigationComponets_Previews: PreviewProvider {
    static var previews: some View {
        NavigationComponets(text: "Profile", action: {},addAction: {})
    }
}

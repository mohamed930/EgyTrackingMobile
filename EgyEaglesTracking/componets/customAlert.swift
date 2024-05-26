//
//  customAlert.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 24/05/2024.
//

import SwiftUI

struct customAlert: View {
    
    @Binding var isActive: Bool
    var imge: String
    var title: String
    var message: String
    var buttonTitle: String
    
    var action: () -> ()
    
    
    @State var offset: CGFloat = 1000
    
    var body: some View {
        
        ZStack {
            
            Color(.black)
                .opacity(0.6)
                .onTapGesture {
                    close()
                }
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center, spacing: 18.0) {
                Image(imge)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(.red)
                    .padding(.top,18)
                
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Text(message)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color("#AAAAAA"))
                    .fixedSize(horizontal: false, vertical: true)
                
                
                HStack(spacing: 20) {
                    // Cancel Button (Outlined)
                    Button(action: {
                        // Action for Cancel button
                        close()
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("#239C6F"))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("#239C6F"), lineWidth: 3)
                            )
                    }
                    .frame(height: 50)
                    .cornerRadius(25)
                    
                    // Logout Button (Filled)
                    Button(action: {
                        // Action for Logout button
                        close()
                        action()
                    }) {
                        Text(buttonTitle)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("#239C6F"))
                            .cornerRadius(25)
                    }

                }
                .padding()
                
            }
            .fixedSize(horizontal: false, vertical: true)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .padding(15)
            .offset(y: offset)
            .onAppear {
                if isActive {
                    withAnimation(.spring()) {
                        offset = 0
                    }
                }
                
            }
        }
        
    }
    
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

struct customAlert_Previews: PreviewProvider {
    static var previews: some View {
        customAlert(isActive: .constant(true),
                    imge: "logoutRed",
                    title: "Logout of app",
                    message: "Are you sure to want logout from app ?",
                    buttonTitle: "Logout",
                    action: {})
    }
}

//
//  BindingAlertComponets.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 21/06/2024.
//

import SwiftUI

struct BindingAlertComponets: View {
    
    @State var selectedIndex: Int? = 0
    
    @State var data = ["Select car"]
    
    @Binding var isActive: Bool
    @State var offset: CGFloat = 1000
    
    var action: () -> ()
    
    private let unitapi = UnitsAPI()
    
    var body: some View {
        
        ZStack {
            
            Color(.black)
                .opacity(0.6)
                .onTapGesture {
                     close()
                }
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center,spacing: 16) {
                
                Image(.bind)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding([.top],15)
                
                Text("Bind car to unit")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                Text("Are you sure to want delete this company ?")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color("#AAAAAA"))
                
                PickerTextField(data: $data,
                                placeHolder: "Select type",
                                lastSelectedIndex: $selectedIndex)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .overlay {
                    HStack {
                        Spacer()
                        
                        Image("downIndecator")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26)
                            .padding([.bottom], 4)
                        
                        Text("")
                        Text("")
                        Text("")
                    }
                }
                .padding()
                
                
                HStack(spacing: 20) {
                    // Cancel Button (Outlined)
                    Button(action: {
                        // Action for Cancel button
                        close()
                        action()
                        
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
                        close()
                        
                    }) {
                        Text("Confirm")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("#239C6F"))
                            .cornerRadius(25)
                    }

                } // MARK: - HStack
                .padding([.leading,.trailing,.bottom],20)
                
            } // MARK: - VStack
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
                
                Task {
                    do {
                        let response = try await unitapi.fetchUnitsForBinding()
                        
                        if response.success {
                            guard let data = response.data else { return }
                            
                            let imeis = data.map({ $0.imei })
                            
                            DispatchQueue.main.async {
                                self.data += imeis
                            }
                        }
                    }
                    catch {
                        print(error.localizedDescription)
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

#Preview {
    @State var isActive: Bool = true
    return BindingAlertComponets(isActive: $isActive, action: {})
}

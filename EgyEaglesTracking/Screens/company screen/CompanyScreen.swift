//
//  CompanyScreen.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI


struct CompanyScreen: View {
    
    @StateObject var viewmodel = CompanyViewModel()
    
    @State var alertActive: Bool = false
    @State var NavigationFlag: Bool = false
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // Screen Body
                VStack {
                    
                    // 1. navigation View
                    NavigationComponets(text: "Companies",isHidden: false,action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    },addAction: {
                        NavigationFlag.toggle()
                    })
                    .padding([.bottom],32)
                    NavigationLink("", destination: AddCompanyScreen(), isActive: $NavigationFlag)
                    
                    
                    Group {
                        if viewmodel.count == "0" {
                            Spacer()
                            Spacer()
                            PlaceHolderComponents(imge: "noDataFound", title: "There is no Companies", message: "Please, add Companies to edit it")
                            Spacer()
                            Spacer()
                        }
                        else {
                            // 2. you found.
                            HStack {
                                HStack {
                                    Text("Your companies")
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                
                                Text("\(viewmodel.count)")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                
                                Text("company found")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                            }
                            .padding([.leading,.trailing],16)
                            
                            
                            // 3. list of companies.
                            List(viewmodel.companies) { str in
                                
                                
                                ZStack {
                                    
                                    CompanyCell(model: str)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets()) // Remove default padding
                                    .padding([.horizontal],15)
                                    .padding([.top,.bottom],10)
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    
                                    NavigationLink(destination: AddCompanyScreen(companyModel: str)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    .buttonStyle(PlainButtonStyle())
                                    
                                }
                                .listStyle(PlainListStyle())
                                .listRowInsets(EdgeInsets()) // Remove default padding
                                .listRowSeparator(.hidden)
                                .buttonStyle(PlainButtonStyle())
                                .listRowBackground(Color.clear)
                                .swipeActions {
                                    Button(role: .destructive) {
                                         alertActive.toggle()
                                        viewmodel.companyId = str.cid
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }

                                }
                                
                                
                                
                                
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                    
                    Spacer()
                } // MARK: - VStack
                
                
                // loading indecator
                if viewmodel.isloading {
                    LoaderIndecatorComponets(isloading: $viewmodel.isloading)
                }
                
                // Add Custom Alert to confrim The deletation operation.
                if alertActive {
                    customAlert(isActive: $alertActive,
                                imge: "TrashIcon",
                                title: "Delete a company",
                                message: "Are you sure to want delete this company ?",
                                buttonTitle: "Delete") {
                        // delete operation.
                        Task {
                            let response = await viewmodel.deleteCompany()
                            
                            if response {
                                viewmodel.deleteCompanyAsUI()
                            }
                        }
                        
                    }
                }
                
            } // MARK: - ZStack
        } // MARK: - NavigationView
        .navigationBarBackButtonHidden(true)
        .task {
            await viewmodel.fetchCompanies()
        }
        
        
    }
    
    private func shouldAllowDelete(for company: CompanyModel) -> Bool {
        // Your logic to determine if delete should be allowed
        return true
    }
}

struct CompanyScreen_Previews: PreviewProvider {
    static var previews: some View {
        CompanyScreen()
    }
}

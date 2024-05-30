//
//  CompanyCell.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 30/05/2024.
//

import SwiftUI

struct CompanyCell: View {
    
    @State var model: CompanyModel
    
    var body: some View {
        
        ZStack {
            HStack {
                HStack(spacing: 12) {
                    Image("CompanyLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        
                    VStack(alignment: .leading,spacing: 4) {
                        
                        
                        Text("\(model.companyName)")
                            .font(.system(size: 14,weight: .medium))
                        
                        
                        Text("\(model.companyType)")
                            .font(.system(size: 12,weight: .medium))
                            .foregroundColor(Color("#FC68FF"))
                    }
                }
                
                Spacer()
                
                VStack(spacing: 5) {
                    Button {
                        print("No")
                    } label: {
                        Circle()
                            .foregroundColor(model.inActive ? .green : .red)
                            .frame(width: 15,height: 15)
                    }
                    
                    Text("tap to Edit it ->")
                        .foregroundColor(Color("#AAAAAA"))
                        .font(.system(size: 14,weight: .medium))
                    

                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20.0)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("#AAAAAA"), lineWidth: 1)
                    .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
            )
        }
        
    }
}

struct CompanyCell_Previews: PreviewProvider {
    static var previews: some View {
        
        let exampleCompany = CompanyModel(
            companyName: "Tech Innovations Inc.",
            customersContractNumber: "12345",
            upLevelID: "U123",
            emailAddress: "contact@techinnovations.com",
            inActive: false,
            comments: "Leading provider of tech solutions.",
            phoneNumber: "555-1234",
            adminID: "A789",
            commercialRecordIssueDateHijri: "1442-07-01",
            managerPhoneNumber: "555-5678",
            customerType: "Corporate",
            address: "123 Tech Lane",
            priority: 1,
            companyType: "Private",
            cid: "C987",
            contractNumber: "C1234",
            commercialRecordNumber: "CR456",
            managerName: "John Doe",
            consuming: "High",
            contractEndDate: "2025-12-31",
            managerMobileNumber: "555-8765",
            waslID: "W123",
            identityNumber: "ID5678",
            dateOfBirth: "1980-01-01"
        )
        
        CompanyCell(model: exampleCompany)
    }
}

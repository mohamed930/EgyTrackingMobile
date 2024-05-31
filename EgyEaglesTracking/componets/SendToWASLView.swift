//
//  SendToWASLView.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 31/05/2024.
//

import SwiftUI

struct SendToWASLView: View {
    @State private var isChecked: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            Toggle(isOn: $isChecked) {
                Text("Send To WASL")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
            .toggleStyle(CheckboxToggleStyle())
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(.systemGray3))
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("#E5E7EB"), lineWidth: 6)
            )
            
            Spacer()
        }
        .listRowInsets(EdgeInsets()) // Remove default padding
        .listRowSeparator(.hidden)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
        .listRowInsets(EdgeInsets()) // Remove default padding
        .listRowSeparator(.hidden)
    }
}

struct SendToWASLView_Previews: PreviewProvider {
    static var previews: some View {
        SendToWASLView()
    }
}

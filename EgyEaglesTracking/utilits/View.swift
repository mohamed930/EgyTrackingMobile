//
//  View.swift
//  EgyEaglesTracking
//
//  Created by Mohamed Ali on 20/05/2024.
//

import SwiftUI

extension View {
      func endTextEditing() {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
      }
    
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}


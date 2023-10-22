//
//  SignupButton.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

import SwiftUI

struct SignupButton: View {
    var action: (() -> Void)?
    
    init(action: (() -> Void)?) {
        self.action = action
    }
    
    var body: some View {
            Button(action: {
                action?()
            }) {
                HStack {
                    Text(StaticTexts.register.rawValue)
                        .font(DesignConstants.primaryFont)
                        .foregroundColor(DesignConstants.primaryFontColor)

                }
                .padding()
                .frame(width: DesignConstants.buttonWidth)
                .background(DesignConstants.textfieldColor)
                .cornerRadius(DesignConstants.cornerRadius)
                .buttonStyle(PlainButtonStyle())
            }
        }
}

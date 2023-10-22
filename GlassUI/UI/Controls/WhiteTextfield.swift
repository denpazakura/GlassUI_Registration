//
//  WhiteTextfield.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

struct WhiteTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(DesignConstants.textfieldColor)
                .frame(height: 50)
            
            HStack {
                TextField(placeholder, text: $text)
                    .font(DesignConstants.primaryFont)
                    .foregroundColor(DesignConstants.primaryFontColor)
                    .padding(.horizontal, 16)
            }
        }
        .padding(.horizontal, 16)
    }
}

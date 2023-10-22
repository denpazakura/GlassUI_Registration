//
//  TextModifiers.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

struct ScreenTitle: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(DesignConstants.titleFont)
            .foregroundColor(DesignConstants.primaryFontColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(x: DesignConstants.titlePadding)
    }
}

struct ConfirmationText: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(DesignConstants.primaryFont)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(DesignConstants.smallPadding)
            .padding(.leading, DesignConstants.standardPadding)
    }
}

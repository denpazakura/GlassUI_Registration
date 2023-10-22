//
//  UnderlayView.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

import SwiftUI

struct UnderlayView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: DesignConstants.cornerRadius)
            .fill(Color("underlay").opacity(0.3))
            .frame(width: DesignConstants.underlayWidth, height: DesignConstants.underlayHeight)
            .background(DesignConstants.underlayViewColor)
            .cornerRadius(DesignConstants.cornerRadius)
    }
}

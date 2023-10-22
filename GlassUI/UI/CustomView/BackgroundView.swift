//
//  BackgroundView.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [DesignConstants.gradientSecondaryColor, DesignConstants.gradientPrimaryColor],
                           startPoint: .topLeading,
                           endPoint: .center)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .frame(width: DesignConstants.circleFrame)
                .foregroundColor(DesignConstants.textfieldColor)
                .blur(radius: DesignConstants.circleBlurRadius)
                .offset(y: DesignConstants.circleOffset)
        }
    }
    
    private enum DesignConstants {
        //frames
        static var circleFrame: Double {
            UIDevice.current.userInterfaceIdiom == .phone ? 300 : 400
        }
        
        static var circleOffset: Double {
            UIDevice.current.userInterfaceIdiom == .phone ? -200 : -300
        }
        
        static var circleBlurRadius: Double {
            10
        }
    
        // colors
        static var textfieldColor: Color {
            Color("sun_moon").opacity(0.4)
        }
        
        static var gradientPrimaryColor: Color {
            Color("background_gradient_primary")
        }
        
        static var gradientSecondaryColor: Color {
            Color("background_gradient_secondary")
        }
    }
}

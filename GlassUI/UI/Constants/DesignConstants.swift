//
//  DesignConstants.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import Foundation
import SwiftUI

enum DesignConstants {
    
    // fonts
    static var titleFont: Font  {
        Font.custom("PingFangTC-Semibold", size: 46)
    }
    
    static var headerFont: Font  {
        Font.custom("PingFangTC-Semibold", size: 36)
    }
    
    static var primaryFont: Font {
        Font.custom("PingFangTC-Medium", size: 18)
    }
    
    static var sublineFont: Font  {
        Font.custom("PingFangTC-Semibold", size: 10)
    }
    
    // frames and paddings
    static var standardPadding: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 40 : 80
    }
    
    static var titlePadding: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 20 : 80
    }
    
    static var smallPadding: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 0 : 10
    }
    
    static var textfieldWidth: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 380 : 500
    }
    
    static var buttonWidth: Double {
        UIDevice.current.userInterfaceIdiom == .phone ? 200 : 300
    }
    
    static var underlayWidth: Double {
        UIScreen.main.bounds.size.width - titlePadding
    }
    
    static var underlayHeight: Double {
        UIScreen.main.bounds.size.height * 0.5
    }
    
    static var cornerRadius: Double {
        12
    }
    
    // colors
    static var underlayViewColor: Color {
        Color("underlay").opacity(0.5)
    }
    
    static var textfieldColor: Color {
        Color("textfield-background")
    }
    
    static var primaryFontColor: Color {
        Color("primary_font")
    }
}

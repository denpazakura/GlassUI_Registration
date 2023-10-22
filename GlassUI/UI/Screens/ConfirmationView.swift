//
//  ConfirmationView.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

struct ConfirmationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Text(StaticTexts.confirmation.rawValue)
                        .modifier(ScreenTitle())
                    UnderlayView()
                        .overlay {
                            VStack {
                                Text("username: \(viewModel.userName)")
                                    .modifier(ConfirmationText())
                                Text("e-mail: \(viewModel.registrationEmail)")
                                    .modifier(ConfirmationText())
                                Text("date of birth: \(viewModel.formattedDate())")
                                    .modifier(ConfirmationText())
                            }
                        }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(viewModel: RegistrationViewModel())
    }
}

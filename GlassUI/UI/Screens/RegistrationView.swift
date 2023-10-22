//
//  RegistrationView.swift
//  MPilotTask
//
//  Created by Diana Komolova on 21/09/2023.
//

import SwiftUI

struct RegistrationView: View {
    private enum Destination {
        case destinationPage
    }
    
    @ObservedObject var viewModel: RegistrationViewModel
    @State private var usernameTextfieldChanged = false
    @State private var emailTextfieldChanged = false
    @State private var birthdatePickerChanged = false
    @State var showConformation: Bool = false
    @State var path: NavigationPath = .init()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $path) {
                ZStack {
                    BackgroundView()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Text(StaticTexts.registration.rawValue)
                                .modifier(ScreenTitle())
                            UnderlayView()
                                .overlay {
                                    VStack {
                                        WhiteTextField(text: $viewModel.userName, placeholder: StaticTexts.name.rawValue)
                                            .frame(width: DesignConstants.textfieldWidth)
                                            .onChange(of: viewModel.userName) { _ in
                                                usernameTextfieldChanged = true
                                            }
                                        Text("Please provide a valid username")
                                            .padding(.leading, DesignConstants.standardPadding)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(DesignConstants.sublineFont)
                                            .foregroundColor(.red)
                                            .opacity((viewModel.isUsernameValid || !usernameTextfieldChanged) ? 0 : 1)

                                        WhiteTextField(text: $viewModel.registrationEmail, placeholder: StaticTexts.email.rawValue)
                                            .frame(width: DesignConstants.textfieldWidth)
                                            .onChange(of: viewModel.registrationEmail) { _ in
                                                emailTextfieldChanged = true
                                            }
                                        Text("Please provide a valid e-mail")
                                            .padding(.leading, DesignConstants.standardPadding)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(DesignConstants.sublineFont)
                                            .foregroundColor(.red)
                                            .opacity((viewModel.isEmailValid || !emailTextfieldChanged) ? 0 : 1)
                                            .padding(.vertical, DesignConstants.smallPadding)
                                        
                                        DatePicker(StaticTexts.birthdate.rawValue, selection: $viewModel.birthdate, displayedComponents: .date)
                                            .pickerStyle(.segmented)
                                            .accessibilityIdentifier("DatePicker")
                                            .accentColor(.pink)
                                            .foregroundColor(DesignConstants.primaryFontColor)
                                            .font(DesignConstants.primaryFont)
                                            .padding(.leading, DesignConstants.standardPadding)
                                            .padding(.trailing, DesignConstants.standardPadding)
                                            .onChange(of: viewModel.birthdate) { _ in
                                                birthdatePickerChanged = true
                                            }
                                        
                                        Text("Please provide a date between 01.01.1990 and 31.12.2019")
                                            .padding(.leading, DesignConstants.standardPadding)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(DesignConstants.sublineFont)
                                            .foregroundColor( !birthdatePickerChanged
                                                              ? DesignConstants.primaryFontColor : .red)
                                            .opacity(viewModel.isBirthdateValid ? 0 : 1)
                                            .padding(.vertical, DesignConstants.standardPadding)
                                        
                                        SignupButton {
                                            path.append(Destination.destinationPage)
                                        }
                                        .disabled(!viewModel.isFormValid)
                                    }
                                }
                        }
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                    }
                }
            }
            .navigationDestination(for: Destination.self) { value in
                ConfirmationView(viewModel: viewModel)
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone Preview")
        RegistrationView(viewModel: RegistrationViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4th generation)"))
            .previewDisplayName("iPad Preview")
    }
}

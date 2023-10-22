//
//  RegistrationViewModel.swift
//  MPilotRegistration
//
//  Created by Diana Komolova on 21/09/2023.
//

import Foundation
import Combine

final class RegistrationViewModel: ObservableObject {
    @Published var userName = ""
    @Published var registrationEmail = ""
    @Published var birthdate = Date()
    
    private var publishers = Set<AnyCancellable>()
    
    @Published var isFormValid = false
    @Published var isBirthdateValid = false
    @Published var isUsernameValid = false
    @Published var isEmailValid = false
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter
    }()
    
    init() {
        isUserNameValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isUsernameValid, on: self)
            .store(in: &publishers)
        
        isEmailValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isEmailValid, on: self)
            .store(in: &publishers)
        
        isBirthdateValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isBirthdateValid, on: self)
            .store(in: &publishers)
        
        isSignupFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isFormValid, on: self)
            .store(in: &publishers)
    }
    
    var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .map { name in
                return !name.trimmingCharacters(in: .whitespaces).isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $registrationEmail
            .map { email in
                let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
                return !email.isEmpty && emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    var isBirthdateValidPublisher: AnyPublisher<Bool, Never> {
        $birthdate
            .map { date in
                let calendar = Calendar.current
                let minDate = calendar.date(from: DateComponents(year: 1900, month: 1, day: 1))!
                let maxDate = calendar.date(from: DateComponents(year: 2019, month: 12, day: 31))!
                return minDate...maxDate ~= date
            }
            .eraseToAnyPublisher()
    }
    
    var isSignupFormValidPublisher: AnyPublisher<Bool, Never> {
      Publishers.CombineLatest3(
        isUserNameValidPublisher,
        isEmailValidPublisher,
        isBirthdateValidPublisher)
        .map { isNameValid, isEmailValid, isBirthdateValid in
            return isNameValid && isEmailValid && isBirthdateValid
        }
        .eraseToAnyPublisher()
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    func formattedDate() -> String {
        dateFormatter.string(from: birthdate)
    }
}

private extension RegistrationViewModel {
    func emailPredicate() -> NSPredicate {
        NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
    }
}

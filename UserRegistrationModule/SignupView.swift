//
//  ContentView.swift
//  UserRegistrationModule
//
//  Created by Dev on 4/13/23.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func isFirstNameValid(_ name: String) -> Bool {
        return name.count >= 2
    }
    
    func isLastNameValid(_ name: String) -> Bool {
        return name.count >= 2
    }
    
    func isEmailValid(_ email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        return password.count >= 8
    }
    
    func doConfirmPasswordMatch(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

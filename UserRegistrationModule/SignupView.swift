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
        return !name.isEmpty
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

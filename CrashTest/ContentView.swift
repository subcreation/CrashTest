//
//  ContentView.swift
//  CrashTest
//
//  Created by Nathanael Roberton on 9/2/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: FormlessView()) {
                    Text("Formless View")
                }
                NavigationLink(destination: FormView()) {
                    Text("Form view")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

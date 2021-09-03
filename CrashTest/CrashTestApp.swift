//
//  CrashTestApp.swift
//  CrashTest
//
//  Created by Nathanael Roberton on 9/2/21.
//

import SwiftUI

@main
struct CrashTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

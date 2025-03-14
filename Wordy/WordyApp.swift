//
//  WordyApp.swift
//  Wordy
//
//  Created by 양시준 on 3/13/25.
//

import SwiftUI
import SwiftData

@main
struct WordyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            WordItem.self,
            WordGroup.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}

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
    var modelContainer: ModelContainer
    
    init() {
        do {
            let schema = Schema([WordGroup.self, WordItem.self, WordSense.self])
            let modelConfiguration = ModelConfiguration(schema: schema)
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(modelContainer)
        }
    }
}

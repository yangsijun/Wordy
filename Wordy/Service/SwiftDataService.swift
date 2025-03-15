//
//  SwiftDataService.swift
//  Wordy
//
//  Created by 양시준 on 3/15/25.
//

import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        let schema = Schema([WordGroup.self, WordItem.self, WordSense.self])
        self.modelContainer = try! ModelContainer(for: schema)
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchWordGroups() -> [WordGroup] {
        do {
            return try modelContext.fetch(FetchDescriptor<WordGroup>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addWordGroup(_ wordGroup: WordGroup) {
        modelContext.insert(wordGroup)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

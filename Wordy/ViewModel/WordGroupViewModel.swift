//
//  WordGroupViewModel.swift
//  Wordy
//
//  Created by 양시준 on 3/15/25.
//

import SwiftUI
import SwiftData

class WordGroupViewModel: ObservableObject {
    @Published var wordGroups: [WordGroup] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        
        wordGroups = dataSource.fetchWordGroups()
    }
    
    func loadInitialData() {
        let initialDataWordGroups = InitialDataLoader.getInitialDataWordGroups()
        for wordGroup in initialDataWordGroups {
            dataSource.addWordGroup(wordGroup)
        }
        
        wordGroups = dataSource.fetchWordGroups()
    }
}

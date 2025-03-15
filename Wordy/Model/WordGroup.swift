//
//  WordGroup.swift
//  Wordy
//
//  Created by 양시준 on 3/13/25.
//

import Foundation
import SwiftData

@Model
class WordGroup {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute var title: String
    @Relationship var words: [WordItem] = []
    
    init(title: String) {
        self.title = title
    }
    
    init(title: String, words: [WordItem]) {
        self.title = title
        self.words = words
    }
    
    func addWord(_ word: WordItem) {
        words.append(word)
    }
    
    func removeWord(at index: Int) {
        words.remove(at: index)
    }
}

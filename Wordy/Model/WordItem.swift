//
//  WordItem.swift
//  Wordy
//
//  Created by 양시준 on 3/13/25.
//

import SwiftData

@Model
class WordItem {
    @Attribute(.unique) var id: String
    var word: String
    var pos: String
    var phonetics: [String]
    @Relationship(deleteRule: .cascade, inverse: \WordSense.word) var senses: [WordSense]?
    var wordGroup: [WordGroup]?
    var isLearned: Bool = false
    
    init(id: String, word: String, pos: String, phonetics: [String], senses: [WordSense]) {
        self.id = id
        self.word = word
        self.pos = pos
        self.phonetics = phonetics
        self.senses = senses
    }
}

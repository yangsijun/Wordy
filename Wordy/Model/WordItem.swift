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
    var senses = [WordSense]()
    
    init(word_id: String, word: String, pos: String, phonetics: [String], senses: [WordSense]) {
        self.id = id
        self.word = word
        self.pos = pos
        self.phonetics = phonetics
        self.senses = senses
    }
}

struct WordSense {
    var id: String
    var group: [String]
    var cefr: String
    var meaning: String
    var examples: [String]
    
    mutating func addExample(_ example: String) {
        self.examples.append(example)
    }
    
    mutating func removeExample(at index: Int) {
        self.examples.remove(at: index)
    }
}

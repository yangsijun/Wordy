//
//  WordSense.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftData
import Foundation

@Model
class WordSense {
    @Attribute(.unique) var id: String
    var word: WordItem?
    var group: [String]
    var cefr: String
    var meaning: String
    var examples: [String]
    var lastReviewedAt: Date?
    var nextReviewAt: Date?
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    var proficiencyLevel: Int = 0
    
    init(id: String, group: [String], cefr: String, meaning: String, examples: [String]) {
        self.id = id
        self.group = group
        self.cefr = cefr
        self.meaning = meaning
        self.examples = examples
    }
    
    func addExample(_ example: String) {
        self.examples.append(example)
    }
    
    func removeExample(at index: Int) {
        self.examples.remove(at: index)
    }
}

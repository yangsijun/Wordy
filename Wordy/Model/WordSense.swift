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
    
    func handleReviewResult(_ isCorrect: Bool) {
        if isCorrect {
            self.correctCount += 1
            incorrectCount = 0
        } else {
            self.correctCount = 0
            self.incorrectCount += 1
        }
        
        self.proficiencyLevel = correctCount - incorrectCount
        self.lastReviewedAt = .now
        self.nextReviewAt = calculateNextReviewAt()
        
        print(correctCount, incorrectCount, proficiencyLevel)
        print(lastReviewedAt ?? Date(), nextReviewAt ?? Date())
    }
    
    func calculateNextReviewAt() -> Date {
        let calendar = Calendar.current
        let now = Date()
        
        var interval: TimeInterval
        
        if (proficiencyLevel < 0) {
            interval = 12 * 60 * 60 // after 12 hours
        } else if proficiencyLevel == 1 {
            interval = 1 * 24 * 60 * 60 // after 1 day
        } else if proficiencyLevel == 2 {
            interval = 3 * 24 * 60 * 60 // after 3 days
        } else if proficiencyLevel == 3 {
            interval = 7 * 24 * 60 * 60 // after 7 days
        } else if proficiencyLevel == 4 {
            interval = 14 * 24 * 60 * 60 // after 14 days
        } else {
            interval = 30 * 24 * 60 * 60 // after 30 days
        }
        
        return calendar.date(byAdding: .second, value: Int(interval), to: now) ?? now
    }
}

//
//  ReviewScheduler.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

import Foundation

struct ReviewScheduler {
    static func setNextReviewDate(sense: WordSense, isCorrect: Bool) {
        let calendar = Calendar.current
        let now = Date()
        
        var interval: TimeInterval
        
        if isCorrect {
            sense.correctCount += 1
            switch sense.correctCount {
                case 1: interval = 1 * 24 * 60 * 60 // after 1 day
                case 2: interval = 3 * 24 * 60 * 60 // after 3 days
                case 3: interval = 7 * 24 * 60 * 60 // after 7 days
                case 4: interval = 14 * 24 * 60 * 60 // after 14 days
                default: interval = 30 * 24 * 60 * 60 // after 30 days
            }
        } else {
            sense.incorrectCount += 1
            interval = 12 * 60 * 60 // after 12 hours
        }
        
        sense.nextReviewAt = calendar.date(byAdding: .second, value: Int(interval), to: now) ?? now
    }
}

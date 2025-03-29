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
    @Relationship(inverse: \WordItem.wordGroup) var words: [WordItem] = []
    var wordsOfTheDay: [WordItem] = []
    var wordsOfTheDayTimestamp: Date?
    
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
    
    func getWordsOfTheDay() -> [WordItem] {
        if wordsOfTheDayTimestamp != nil && Calendar.current.isDateInToday(wordsOfTheDayTimestamp!) {
            return wordsOfTheDay
        }
        
        wordsOfTheDay = []
        var filteredWords: [WordItem] = []
        
        for word in words {
            if !word.isLearned {
                filteredWords.append(word)
            }
        }
        
        if filteredWords.count < 10 {
            wordsOfTheDay = filteredWords
        } else {
            wordsOfTheDay = Array(filteredWords).shuffled().prefix(10).map { $0 }
        }
        
        wordsOfTheDayTimestamp = Date()
        
        return wordsOfTheDay
    }
    
    func getQuizzes(learningWords: [WordItem], quizType: QuizType) -> [Quiz]? {
        switch quizType {
            case .multipleChoiceWord:
                return getMultipleChoiceWordQuizzes(learningWords: learningWords)
            case .multipleChoiceMeaning:
                return getMultipleChoiceMeaningQuizzes(learningWords: learningWords)
        }
    }
    
    private func getMultipleChoiceWordQuizzes(learningWords: [WordItem]) -> [Quiz]? {
        var allSenses: [WordSense] = []
        for word in words {
            allSenses.append(contentsOf: word.senses!)
        }
        
        var learningSenses: [WordSense] = []
        for word in learningWords {
            learningSenses.append(contentsOf: word.senses!)
        }
        
        var quizzes: [Quiz] = []
        for sense in learningSenses {
            let quiz = QuizGenerator.generateMultipleChoiceWordQuiz(senses: allSenses, answerSense: sense)
            if quiz == nil {
                return nil
            }
            quizzes.append(QuizGenerator.generateMultipleChoiceWordQuiz(senses: allSenses, answerSense: sense)!)
        }
        
        quizzes.shuffle()
        
        return quizzes
    }
    
    private func getMultipleChoiceMeaningQuizzes(learningWords: [WordItem]) -> [Quiz]? {
        var allSenses: [WordSense] = []
        for word in words {
            allSenses.append(contentsOf: word.senses!)
        }
        
        var learningSenses: [WordSense] = []
        for word in learningWords {
            learningSenses.append(contentsOf: word.senses!)
        }
        
        var quizzes: [Quiz] = []
        for sense in learningSenses {
            let quiz = QuizGenerator.generateMultipleChoiceMeaningQuiz(senses: allSenses, answerSense: sense)
            if quiz == nil {
                return nil
            }
            quizzes.append(QuizGenerator.generateMultipleChoiceMeaningQuiz(senses: allSenses, answerSense: sense)!)
        }
        
        quizzes.shuffle()
        
        return quizzes
    }

}

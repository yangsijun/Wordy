//
//  Quiz.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

struct Quiz {
    var sense: WordSense
    var question: String
    var options: [String]
    var answer: String
    var type: QuizType
    var selectedOption: String?
    var result: Bool?
}

enum QuizType: String {
    case multipleChoiceMeaning
    case multipleChoiceWord
}

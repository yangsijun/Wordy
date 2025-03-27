//
//  QuizView.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

import SwiftUI

struct QuizView: View {
    @State var quizzes: [Quiz]
    @State var quizIndex: Int = 0
    @State private var showNextQuestion = false
    
    var invalid: Bool = false
    
    
    let correctMessages = [
        "Spot on! 🎯 Well done, let’s crack on with the next one.",
        "Brilliant! 👏 You’re on a roll.",
        "Top marks! ✅ Keep up the great work.",
        "Smashing effort! 🎉 Let’s see what’s next.",
        "Nicely done! 🌟 Fancy another challenge?"
    ]
    
    let incorrectMessages = [
        "Unlucky! ❌ Give it another go next time.",
        "Not quite! 🤔 Don’t worry, you’re learning!",
        "A valiant effort! 💪 Let’s have another try.",
        "Oh dear! 😅 It happens to the best of us.",
        "Close, but no cigar! 🎭 On to the next one."
    ]
    
    init (quizzes: [Quiz]) {
        self.quizzes = quizzes
        self.quizIndex = 0
        if quizzes.isEmpty {
            self.invalid = true
        }
    }
    
    var body: some View {
        VStack {
            if invalid {
                Text("The quiz cannot be created because the number of words stored in the WordGroup is too small.")
            } else {
                if quizIndex < quizzes.count {
                    QuizProblemView(quiz: $quizzes[quizIndex], quizIndex: $quizIndex, showNextQuestion: $showNextQuestion)
                } else {
                    QuizResultView(quizzes: quizzes)
                }
            }
        }
    }
}

#Preview {
    QuizView(
        quizzes: [
            Quiz(sense: WordSense(id: "test_1", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 1", examples: ["example1", "example2"]), question: "this is a test1", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning),
            Quiz(sense: WordSense(id: "test_2", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 2", examples: ["example3", "example4"]), question: "this is a test2", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning),
            Quiz(sense: WordSense(id: "test_3", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 3", examples: ["example5", "example6"]), question: "this is a test3", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning),
            Quiz(sense: WordSense(id: "test_4", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 4", examples: ["example7", "example8"]), question: "this is a test4", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning),
            Quiz(sense: WordSense(id: "test_5", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 5", examples: ["example9", "example10"]), question: "this is a test5", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning)
        ]
    )
}

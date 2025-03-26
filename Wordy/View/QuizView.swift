//
//  QuizView.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

import SwiftUI

struct QuizView: View {
    var quizzes: [Quiz]?
    @State var quiz: Quiz
    @State var quizIndex: Int = 0
    @State var quizResult: [Bool] = []
    @State var isEnded: Bool = false
    
    @State private var selectedOption: String? = nil
    @State private var isCorrect: Bool? = nil
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
    
    init (quizzes: [Quiz]?) {
        if quizzes == nil {
            invalid = true
            self.quiz = Quiz(sense: WordSense(id: "test_1", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 1", examples: ["example1", "example2"]), question: "this is a test1", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning)
        } else {
            self.quizzes = quizzes
            self.quiz = quizzes![0]
            self.quizIndex = 0
        }
    }
    
    var body: some View {
        VStack {
            if invalid {
                Text("The quiz cannot be created because the number of words stored in the WordGroup is too small.")
            } else {
                if isEnded {
                    ScrollView {
                        VStack {
                            ForEach(0..<quizzes!.count, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(UIColor.secondarySystemBackground))
                                    .frame(maxWidth: .infinity, minHeight: 80)
                                    .overlay(
                                        HStack {
                                            Text(quizzes![index].answer)
                                                .padding()
                                            Text(quizResult[index] ? "✅" : "❌")
                                                .padding()
                                        }
                                    )                            }
                        }
                        .padding(20)
                    }
                } else {
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(UIColor.systemFill), lineWidth: 2)
                            .background(.thinMaterial)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .overlay(
                                Text(quiz.question)
                                    .font(.largeTitle)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            )
                        if (showNextQuestion) {
                            VStack {
                                Spacer()
                                    .frame(height: 50)
                                Text(isCorrect == true ? correctMessages.randomElement()! : incorrectMessages.randomElement()!)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 40)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    switch (quiz.type) {
                        case .multipleChoiceMeaning, .multipleChoiceWord:
                            QuizButtonGroupView(
                                quizzes: quizzes!,
                                quiz: $quiz,
                                quizIndex: $quizIndex,
                                quizResult: $quizResult,
                                isEnded: $isEnded,
                                selectedOption: $selectedOption,
                                isCorrect: $isCorrect,
                                showNextQuestion: $showNextQuestion
                            )
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                    }
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

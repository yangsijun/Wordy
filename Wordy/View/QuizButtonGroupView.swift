//
//  QuizButtonGroupView.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

import SwiftUI
import UIKit

struct QuizButtonGroupView: View {
    var quizzes: [Quiz]
    @Binding var quiz: Quiz
    @Binding var quizIndex: Int
    
    @Binding var selectedOption: String?
    @Binding var isCorrect: Bool?
    @Binding var showNextQuestion: Bool
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 8) {
            ForEach(quiz.options, id: \.self) { option in
                if isCorrect == nil {
                    Button(action: {
                        handleAnswer(option)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(UIColor.secondarySystemBackground))
                                .stroke(Color(UIColor.systemFill), lineWidth: 2)
                                .frame(minHeight: 80)
                            Text(option)
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                        }
                    }
                } else {
                    Button(action: {
                        handleAnswer(option)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(
                                    option == quiz.answer
                                        ? Color(UIColor.systemTeal).opacity(0.3)
                                        : Color(UIColor.secondarySystemBackground)
                                )
                                .stroke(
                                    option == quiz.answer
                                        ? Color(UIColor.systemTeal)
                                        : option == selectedOption
                                            ? Color(UIColor.systemOrange)
                                            : Color(UIColor.systemFill),
                                    lineWidth: 3
                                )
                                .frame(minHeight: 80)
                            Text(option)
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                        }
                    }
                }
            }
        }
    }
    
    func handleAnswer(_ option: String) {
        selectedOption = option
        isCorrect = option == quiz.answer
        
        showNextQuestion = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            nextQuiz()
        }
    }
    
    func nextQuiz() {
        selectedOption = nil
        isCorrect = nil
        showNextQuestion = false
        
        quizIndex += 1
        if quizIndex >= quizzes.count {
            quizIndex = 0
        }
        quiz = quizzes[quizIndex]
    }
}


#Preview {
    QuizButtonGroupView(
        quizzes: [
            Quiz(question: "this is a test1", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceWord),
            Quiz(question: "this is a test2", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceWord),
            Quiz(question: "this is a test3", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceWord),
            Quiz(question: "this is a test4", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceWord),
            Quiz(question: "this is a test5", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceWord)
        ],
        quiz: .constant(Quiz(question: "this is a test", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceWord)),
        quizIndex: .constant(0),
        selectedOption: .constant(nil),
        isCorrect: .constant(nil),
        showNextQuestion: .constant(false)
    )
}

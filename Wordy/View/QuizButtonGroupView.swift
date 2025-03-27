//
//  QuizButtonGroupView.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

import SwiftUI
import UIKit

struct QuizButtonGroupView: View {
    @Binding var quiz: Quiz
    @Binding var quizIndex: Int
    @Binding var showNextQuestion: Bool
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 8) {
            ForEach(quiz.options, id: \.self) { option in
                if quiz.result == nil {
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
                                        : option == quiz.selectedOption
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
                        .disabled(showNextQuestion)
                }
            }
        }
    }
    
    func handleAnswer(_ option: String) {
        quiz.selectedOption = option
        quiz.result = quiz.selectedOption! == quiz.answer
        
        quiz.sense.handleReviewResult(quiz.result!)
        
        showNextQuestion = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            nextQuiz()
        }
    }
    
    func nextQuiz() {
        quizIndex += 1
        showNextQuestion = false
    }
}


#Preview {
    QuizButtonGroupView(
        quiz: .constant(Quiz(sense: WordSense(id: "test_1", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 1", examples: ["example1", "example2"]), question: "this is a test1", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning)),
        quizIndex: .constant(0),
        showNextQuestion: .constant(false)
    )
}

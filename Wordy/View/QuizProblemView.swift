//
//  QuizProblemView.swift
//  Wordy
//
//  Created by 양시준 on 3/27/25.
//

import SwiftUI

struct QuizProblemView: View {
    @Binding var quiz: Quiz
    @Binding var quizIndex: Int
    @Binding var showNextQuestion: Bool
    
    var body: some View {
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
//            if (showNextQuestion) {
//                VStack {
//                    Spacer()
//                        .frame(height: 50)
//                    Text(isCorrect == true ? correctMessages.randomElement()! : incorrectMessages.randomElement()!)
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal, 40)
//                        .fixedSize(horizontal: false, vertical: true)
//                }
//            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        switch (quiz.type) {
            case .multipleChoiceMeaning, .multipleChoiceWord:
                QuizButtonGroupView(
                    quiz: $quiz,
                    quizIndex: $quizIndex,
                    showNextQuestion: $showNextQuestion
                )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
        }
    }
}

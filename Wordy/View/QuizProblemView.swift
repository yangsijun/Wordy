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
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor.systemFill), lineWidth: 2)
                .background(.thinMaterial)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    TextSpeechButton(text: quiz.question)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                )
            
            if (showNextQuestion) {
                VStack {
                    Spacer()
                        .frame(height: 20)
                    Text(quiz.result == true ? correctMessages.randomElement()! : incorrectMessages.randomElement()!)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(
                            Capsule()
                                .fill(Color(UIColor.secondarySystemFill))
                        )
                }
            }
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

#Preview {
    QuizProblemView(
        quiz: .constant(
            Quiz(
                sense: WordSense(id: "test_1", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 1", examples: ["example1", "example2"]), question: "this is a test1", options: ["a", "b", "c", "d"], answer: "a", type: .multipleChoiceMeaning)
            ),
        quizIndex: .constant(0),
        showNextQuestion: .constant(true)
    )
}

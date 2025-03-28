//
//  QuizResultView.swift
//  Wordy
//
//  Created by 양시준 on 3/27/25.
//

import SwiftUI

struct QuizResultView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var showQuiz: Bool
    
    var quizzes: [Quiz]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<quizzes.count, id: \.self) { index in
                    NavigationLink(
                        destination: ScrollView { WordItemCardView(word: quizzes[index].sense.word) }
                    ) {
                        HStack {
                            Text(quizzes[index].answer)
                            Spacer()
                            if quizzes[index].result! {
                                Text("Correct")
                                    .foregroundColor(Color(UIColor.systemTeal))
                                    .padding(.trailing)
                            } else {
                                Text("Incorrect")
                                    .foregroundColor(Color(UIColor.systemOrange))
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Quiz Result")
        }
        Button(action: {
            dismiss()
            showQuiz = false
        }) {
            Text("Done")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    QuizResultView(
        showQuiz: .constant(true),
        quizzes: [
            Quiz(sense: WordSense(id: "test_1", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 1", examples: ["example1", "example2"]), question: "this is a test1", options: ["abandon", "b", "c", "d"], answer: "abandon", type: .multipleChoiceMeaning, selectedOption: "abandon", result: true),
            Quiz(sense: WordSense(id: "test_2", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 2", examples: ["example3", "example4"]), question: "this is a test2", options: ["ability", "b", "c", "d"], answer: "ability", type: .multipleChoiceMeaning, selectedOption: "ability", result: true),
            Quiz(sense: WordSense(id: "test_3", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 3", examples: ["example5", "example6"]), question: "this is a test3", options: ["able", "b", "c", "d"], answer: "able", type: .multipleChoiceMeaning, selectedOption: "able", result: true),
            Quiz(sense: WordSense(id: "test_4", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 4", examples: ["example7", "example8"]), question: "this is a test4", options: ["abolish", "b", "c", "d"], answer: "abolish", type: .multipleChoiceMeaning, selectedOption: "b", result: false),
            Quiz(sense: WordSense(id: "test_5", group: ["ox3000"], cefr: "a2", meaning: "Test Meaning 5", examples: ["example9", "example10"]), question: "this is a test5", options: ["abortion", "b", "c", "d"], answer: "abortion", type: .multipleChoiceMeaning, selectedOption: "abortion", result: true)
        ]
    )
}

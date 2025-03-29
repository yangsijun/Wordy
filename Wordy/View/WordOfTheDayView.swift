//
//  WordOfTheDayView.swift
//  Wordy
//
//  Created by 양시준 on 3/20/25.
//

import SwiftUI
import SwiftData

struct WordOfTheDayView: View {
    var wordGroup: WordGroup
    var words: [WordItem]
    @State var wordIndex: Int = 0
    @State var showQuiz: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    WordItemCardView(word: words[wordIndex])
                        .padding()
                }
                HStack {
                    Button(action: {
                        wordIndex -= 1
                    }) {
                        Text("Previous")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.tertiarySystemFill))
                            .cornerRadius(10)
                    }
                    .disabled(wordIndex == 0)
                    if wordIndex == words.count - 1 {
                        Button(action: {
                            showQuiz = true
                        }) {
                            Text("Start Quiz")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10)
                        }
                        .fullScreenCover(isPresented: $showQuiz) {
                            QuizView(quizzes: wordGroup.getMultipleChoiceWordQuizzes(learningWords: words) ?? [], showQuiz: $showQuiz)
                        }
                    } else {
                        Button(action: {
                            wordIndex += 1
                        }) {
                            Text("Next")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WordOfTheDayView(
        wordGroup: WordGroup(
            title: "Oxford",
            words: [
                WordItem(
                    id: "abandon_1",
                    word: "abandon",
                    pos: "verb",
                    phonetics: ["/əˈbændən/"],
                    senses: [
                        WordSense(
                            id: "abandon_sng_1",
                            group: ["ox3000"],
                            cefr: "b2",
                            meaning: "to leave somebody, especially somebody you are responsible for, with no intention of returning",
                            examples: [
                                "The baby had been abandoned by its mother.",
                                "People often simply abandon their pets when they go abroad.",
                                "‘We have been abandoned to our fate,’ said one resident.",
                                "The study showed a deep fear among the elderly of being abandoned to the care of strangers."
                            ]
                        )
                    ]
                ),
                WordItem(
                    id: "her_1",
                    word: "her",
                    pos: "pronoun",
                    phonetics: ["/hə(r)/"],
                    senses: [
                        WordSense(
                            id: "her_sng_1",
                            group: ["ox5000"],
                            cefr: "a1",
                            meaning: "used as the object of a verb, after the verb be or after a preposition to refer to a woman or girl who has already been mentioned or is easily identified",
                            examples: [
                                "We're going to call her Sophie.",
                                "Please give her my regards.",
                                "The manager will be free soon—you can wait for her here.",
                                "That must be her now."
                            ]
                        )
                    ]
                )
            ]
        ),
        words: [
            WordItem(
                id: "abandon_1",
                word: "abandon",
                pos: "verb",
                phonetics: ["/əˈbændən/"],
                senses: [
                    WordSense(
                        id: "abandon_sng_1",
                        group: ["ox3000"],
                        cefr: "b2",
                        meaning: "to leave somebody, especially somebody you are responsible for, with no intention of returning",
                        examples: [
                            "The baby had been abandoned by its mother.",
                            "People often simply abandon their pets when they go abroad.",
                            "‘We have been abandoned to our fate,’ said one resident.",
                            "The study showed a deep fear among the elderly of being abandoned to the care of strangers."
                        ]
                    )
                ]
            ),
            WordItem(
                id: "her_1",
                word: "her",
                pos: "pronoun",
                phonetics: ["/hə(r)/"],
                senses: [
                    WordSense(
                        id: "her_sng_1",
                        group: ["ox5000"],
                        cefr: "a1",
                        meaning: "used as the object of a verb, after the verb be or after a preposition to refer to a woman or girl who has already been mentioned or is easily identified",
                        examples: [
                            "We're going to call her Sophie.",
                            "Please give her my regards.",
                            "The manager will be free soon-you can wait for her here.",
                            "That must be her now."
                        ]
                    )
                ]
            )
        ]
    )
}

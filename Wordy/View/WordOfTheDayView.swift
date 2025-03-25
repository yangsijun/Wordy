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
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    WordItemCardView(word: words[wordIndex])
                        .padding()
                    //            HStack {
                    //                Button(action: { wordIndex -= 1 }) {
                    //                    Image(systemName: "chevron.left")
                    //                }
                    //                .disabled(wordIndex == 0)
                    //                Text(String(wordIndex + 1) + " / " + String(words.count))
                    //                    .foregroundColor(Color(UIColor.secondaryLabel))
                    //                Button(action: { wordIndex += 1 }) {
                    //                    Image(systemName: "chevron.right")
                    //                }
                    //                .disabled(wordIndex == words.count - 1)
                    //            }
                    //            .padding(5)
                }
                //            Spacer()
                //                .frame(maxHeight: .infinity)
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
                        NavigationLink(destination: QuizView(quizzes: wordGroup.getWordQuizzes(learningWords: words))) {
                            Text("Start Quiz")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10)
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
            //        Button(action: {}) {
            //            Text("Start Quiz")
            //                .padding()
            //                .frame(maxWidth: .infinity)
            //                .background(Color.blue)
            //                .foregroundColor(.white)
            //                .cornerRadius(10)
            //        }
            //        .padding()
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
                    id: "bandon_1",
                    word: "bandon",
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
                id: "bandon_1",
                word: "bandon",
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
            )
        ]
    )
}

//
//  WordGroupView.swift
//  Wordy
//
//  Created by 양시준 on 3/22/25.
//

import SwiftUI
import SwiftData

struct WordGroupView: View {
    @State var wordGroup: WordGroup!
    
    var body: some View {
        NavigationStack {
            List(wordGroup.words.sorted(by: { $0.id < $1.id }), id: \.id) { word in
                NavigationLink(destination: WordView(word: word)) {
                    HStack {
                        Text(word.word)
                        Text(word.pos)
                            .font(.caption)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                }
            }
            .navigationTitle(wordGroup.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    WordGroupView(wordGroup: WordGroup(
        title: "Oxford 3000",
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
            )
        ]
    ))
}

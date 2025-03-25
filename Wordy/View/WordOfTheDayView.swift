//
//  WordOfTheDayView.swift
//  Wordy
//
//  Created by 양시준 on 3/20/25.
//

import SwiftUI
import SwiftData

struct WordOfTheDayView: View {
    var words: [WordItem]
    @State var wordIndex: Int = 0
    
    var body: some View {
        VStack {
            WordItemCardView(word: words[wordIndex])
            HStack {
                Button(action: { wordIndex -= 1 }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(wordIndex == 0)
                Text(String(wordIndex + 1) + " / " + String(words.count))
                    .foregroundColor(Color(UIColor.secondaryLabel))
                Button(action: { wordIndex += 1 }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(wordIndex == words.count - 1)
            }
            .padding(5)
        }
    }
}

#Preview {
    WordOfTheDayView(
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

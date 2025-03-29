//
//  WordView.swift
//  Wordy
//
//  Created by 양시준 on 3/22/25.
//

import SwiftUI
import SwiftData

struct WordView: View {
    @State var word: WordItem!
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    TextSpeechButton(text: word.word)
                        .font(.largeTitle)
                        .bold()
                    Text(word.pos)
                }
                TextSpeechButton(
                    text: word.word,
                    content: HStack {
                        Image(systemName: "speaker.fill")
                            .foregroundColor(.blue)
                        Text(word.phonetics[0])
                    }
                )
                .padding(.bottom, 2)
                ForEach(word.senses!.indices, id: \.self) { idx in
                    let sense = word.senses![idx]
                    HStack(alignment: .top) {
                        Text(String(idx+1) + ".")
                            .bold()
                        VStack(alignment: .leading) {
                            TextSpeechButton(text: sense.meaning)
                                .bold()
                            ForEach(sense.examples, id: \.self) { example in
                                HStack(alignment: .top) {
                                    Text("•")
                                    TextSpeechButton(text: example)
                                        .italic()
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(1)
                            }
                        }
                    }
                    Divider()
                }
                .padding(.vertical, 5)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    WordView(word: WordItem(
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
            ),
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
    ))
}

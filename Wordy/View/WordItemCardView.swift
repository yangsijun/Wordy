//
//  WordItemCardView.swift
//  Wordy
//
//  Created by 양시준 on 3/25/25.
//

import SwiftUI
import SwiftData

struct WordItemCardView: View {
    let word: WordItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    SpeechManager.shared.speak(word.word)
                }) {
                    Text(word.word)
                        .font(.title)
                        .bold()
                }
                .buttonStyle(.plain)
                Text(word.pos)
            }
            HStack {
                Button(action: {
                    SpeechManager.shared.speak(word.word)
                }) {
                    Image(systemName: "speaker.fill")
                }
                .buttonStyle(BorderlessButtonStyle())
                Text(word.phonetics[0])
            }
            .padding(.bottom, 5)
            Divider()
            ForEach(word.senses!.indices, id: \.self) { idx in
                let sense = word.senses![idx]
                HStack(alignment: .top) {
                    Text(String(idx+1) + ".")
                        .bold()
                    VStack(alignment: .leading) {
                        Button(action: {
                            SpeechManager.shared.speak(sense.meaning)
                        }) {
                            Text(sense.meaning)
                                .bold()
                        }
                        .buttonStyle(.plain)
                        WordItemCardExamplesView(examples: sense.examples)
                            .padding(.top, 2)
                    }
                }
            }
            .padding(.vertical, 5)
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(UIColor.secondarySystemBackground))
        )
    }
}

#Preview {
    WordItemCardView(
        word: WordItem(
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
    )
}

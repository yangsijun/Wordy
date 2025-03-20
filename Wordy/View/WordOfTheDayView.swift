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
    
    var body: some View {
        VStack {
            Text("Today's Words")
                .font(.largeTitle)
                .bold()
                .padding()
            
            List(words, id: \.id) { word in
                VStack(alignment: .leading) {
                    HStack {
                        Text(word.word)
                            .font(.title2)
                            .bold()
                        Text(word.pos)
                            .font(.caption)
                        
                    }
                    HStack {
                        Button(action: {
                            SpeechManager.shared.speak(word.word)
                        }) {
                            Image(systemName: "speaker.fill")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Text(word.phonetics[0])
                            .font(.caption)
                    }
                    .padding(.bottom, 2)
                    ForEach(word.senses!.indices, id: \.self) { idx in
                        let sense = word.senses![idx]
                        HStack(alignment: .top) {
                            Text(String(idx+1) + ".")
                                .bold()
                            VStack(alignment: .leading) {
                                Text(sense.meaning)
                                    .bold()
                                Divider()
                                ForEach(sense.examples, id: \.self) { example in
                                    HStack(alignment: .top) {
                                        Text("•")
                                        Text(example)
                                            .italic(true)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            Button(action: {}) {
                Text("Start Quiz")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
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
    )
}

//
//  WordItemCardView.swift
//  Wordy
//
//  Created by 양시준 on 3/25/25.
//

import SwiftUI
import SwiftData

struct WordItemCardView: View {
    var word: WordItem?
    
    var body: some View {
        if word == nil {
            Text("No word selected")
        } else {
            VStack(alignment: .leading) {
                HStack {
                    TextSpeechButton(text: word!.word)
                        .font(.title)
                        .bold()
                    Text(word!.pos)
                }
                TextSpeechButton(
                    text: word!.word,
                    content: HStack {
                        Image(systemName: "speaker.fill")
                            .foregroundColor(.blue)
                        Text(word!.phonetics[0])
                    }
                )
                .padding(.bottom, 5)
                Divider()
                ForEach(word!.senses!.indices, id: \.self) { idx in
                    let sense = word!.senses![idx]
                    HStack(alignment: .top) {
                        Text(String(idx+1) + ".")
                            .bold()
                        VStack(alignment: .leading) {
                            TextSpeechButton(text: sense.meaning)
                                .bold()
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
}

#Preview {
    WordItemCardView(
//        word: WordItem(
//            id: "abandon_1",
//            word: "abandon",
//            pos: "verb",
//            phonetics: ["/əˈbændən/"],
//            senses: [
//                WordSense(
//                    id: "abandon_sng_1",
//                    group: ["ox3000"],
//                    cefr: "b2",
//                    meaning: "to leave somebody, especially somebody you are responsible for, with no intention of returning",
//                    examples: [
//                        "The baby had been abandoned by its mother.",
//                        "People often simply abandon their pets when they go abroad.",
//                        "‘We have been abandoned to our fate,’ said one resident.",
//                        "The study showed a deep fear among the elderly of being abandoned to the care of strangers."
//                    ]
//                )
//            ]
//        )
        word: WordItem(
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
    )
}

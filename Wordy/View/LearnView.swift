//
//  LearnView.swift
//  Wordy
//
//  Created by 양시준 on 3/22/25.
//

import SwiftUI
import SwiftData

struct LearnView: View {
    var wordGroup: WordGroup?
    @State var isShowAddWordView: Bool = false
    @State var isShowEditWordGroupView: Bool = false
    @State var isShowDeleteWordGroupView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                if wordGroup == nil {
                    Text("There are not any word group")
                } else {
                    NavigationLink(destination: WordOfTheDayView(wordGroup: wordGroup!, words: wordGroup!.getWordsOfTheDay())) {
                        Text("Words Of The Day")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(UIColor.label))
                    }
                }
            }
        }
    }
}

#Preview {
    LearnView(
        wordGroup: WordGroup(
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
        )
    )
}

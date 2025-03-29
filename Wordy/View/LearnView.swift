//
//  LearnView.swift
//  Wordy
//
//  Created by 양시준 on 3/22/25.
//

import SwiftUI
import SwiftData

struct LearnView: View {
    @Environment(\.modelContext) private var context
    var wordGroups: [WordGroup]
    
    @State private var selectedWordGroupTitle: String?
    var selectedWordGroup: WordGroup? {
        wordGroups.first { $0.title == selectedWordGroupTitle }
    }
    @State var isShowAddWordView: Bool = false
    @State var isShowEditWordGroupView: Bool = false
    @State var isShowDeleteWordGroupView: Bool = false
    
    init(wordGroups: [WordGroup]) {
        self.wordGroups = wordGroups
        _selectedWordGroupTitle = State(initialValue: wordGroups.first?.title)
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    if wordGroups.isEmpty {
                        Text("There are not any word group")
                    } else {
                        Section {
                            Picker("Word Group", selection: $selectedWordGroupTitle) {
                                ForEach(wordGroups, id: \.title) { wordGroup in
                                    Text(wordGroup.title).tag(wordGroup.title)
                                }
                            }
                        }
                        Section {
                            if wordGroups.first(where: { $0.title == selectedWordGroupTitle }) != nil {
                                NavigationLink(
                                    destination: LearningWordsView(
                                        wordGroup: selectedWordGroup!,
                                        words: selectedWordGroup!.getWordsOfTheDay(),
                                        quizType: .multipleChoiceWord
                                    )
                                ) {
                                    Text("Words Of The Day")
                                        .font(.headline)
                                        .padding(.vertical)
                                }
                                NavigationLink(
                                    destination: LearningWordsView(
                                        wordGroup: selectedWordGroup!,
                                        words: selectedWordGroup!.getReviewWords(),
                                        senses: selectedWordGroup!.getReviewSenses(),
                                        quizType: .multipleChoiceMeaning
                                    )
                                ) {
                                    Text("Revision")
                                        .font(.headline)
                                        .padding(.vertical)
                                }
                                .disabled(selectedWordGroup!.getReviewWords().isEmpty)
                            }
                        }
                    }
                }
                .navigationTitle("Learn")
            }
        }
    }
}

#Preview {
    LearnView(
        wordGroups: [
            WordGroup(
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
        ]
    )
}

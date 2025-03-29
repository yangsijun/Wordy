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
    @State var searchQueryString: String = ""
    
    var body: some View {
        NavigationStack {
            List(
                searchQueryString.isEmpty
                  ? wordGroup.words.sorted(by: { $0.id < $1.id })
                : wordGroup.words
                    .filter { $0.word.localizedStandardContains(searchQueryString) }
                    .sorted {
                        let firstWordStarts = $0.word.lowercased().hasPrefix(searchQueryString.lowercased())
                        let secondWordStarts = $1.word.lowercased().hasPrefix(searchQueryString.lowercased())
                        if firstWordStarts == secondWordStarts {
                            return $0.word < $1.word
                        }
                        return firstWordStarts
                    }
                ,
                id: \.id
            ) { word in
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
            .searchable(
                text: $searchQueryString,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: Text("Search")
            )
            .autocapitalization(.none)
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
                id: "connected",
                word: "connected",
                pos: "adjective",
                phonetics: ["/kəˈnektɪd/"],
                senses: [
                    WordSense(
                        id: "connected_sng_1",
                        group: ["ox3000"],
                        cefr: "A2",
                        meaning: "(of two or more things or people) having a link between them",
                        examples: [
                           "We do not believe that the incidents are connected.",
                           "The two issues are closely connected.",
                           "market prices and other connected matters",
                           "The fall in retail sales is directly connected with the decline in employment.",
                           "jobs connected with the environment",
                           "Many computer files connected to the case have been erased.",
                           "They are connected by marriage."
                       ]
                   )
               ]
            )
        ]
    ))
}

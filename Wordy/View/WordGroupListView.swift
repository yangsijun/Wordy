//
//  WordGroupListView.swift
//  Wordy
//
//  Created by 양시준 on 3/29/25.
//

import SwiftUI
import SwiftData

struct WordGroupListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \WordGroup.title) var wordGroups: [WordGroup]
    @State private var shouldRefresh = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wordGroups) { wordGroup in
                    NavigationLink(destination: WordGroupView(wordGroup: wordGroup)) {
                        Text(wordGroup.title)
                            .font(.headline)
                            .padding(.vertical, 10)
                    }
                }
            }
            .navigationTitle(Text("Word Groups"))
            .id(shouldRefresh)
        }
    }
}

#Preview {
    WordGroupListView()
}

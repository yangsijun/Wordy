//
//  WordGroupGridView.swift
//  Wordy
//
//  Created by 양시준 on 3/16/25.
//

import SwiftUI
import SwiftData

struct WordGroupGridView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \WordGroup.title) var wordGroups: [WordGroup]
    @State private var shouldRefresh = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(wordGroups) { wordGroup in
                    NavigationLink(destination: WordListView(wordGroup: wordGroup)) {
                        ZStack {
                            Rectangle()
                                .fill(Color.accentColor)
                                .cornerRadius(10)
                                .frame(width: 150, height: 150)
                            Text(wordGroup.title)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .id(shouldRefresh)
        }
    }
}

#Preview {
    WordGroupGridView()
}

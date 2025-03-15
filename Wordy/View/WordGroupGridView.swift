//
//  WordGroupGridView.swift
//  Wordy
//
//  Created by 양시준 on 3/16/25.
//

import SwiftUI

struct WordGroupGridView: View {
    @StateObject private var wordGroupViewModel: WordGroupViewModel = WordGroupViewModel(dataSource: .shared)
    
    let columns = [GridItem(), GridItem()]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(wordGroupViewModel.wordGroups) { wordGroup in
//                NavigationLink(destination: WordListView(wordGroup: wordGroup)) {
//                    Text(wordGroup.title)
//                        .font(.headline)
//                }
                Text(wordGroup.title)
            }
        }
    }
}

#Preview {
    WordGroupGridView()
}

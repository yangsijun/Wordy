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
        NavigationView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(wordGroupViewModel.wordGroups) { wordGroup in
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
        }
    }
}

#Preview {
    WordGroupGridView()
}

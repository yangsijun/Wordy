//
//  WordListView.swift
//  Wordy
//
//  Created by 양시준 on 3/17/25.
//

import SwiftUI

struct WordListView: View {
    var wordGroup: WordGroup
    
    init(wordGroup: WordGroup) {
        self.wordGroup = wordGroup
    }
    
    var body: some View {
        List(wordGroup.words) { word in
            Text(word.word)
        }
    }
}

//
//  MainView.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @AppStorage("isFirstOnboarding") var isFirstOnboarding: Bool = true
    @Query var wordGroups: [WordGroup]

    var body: some View {
        TabView {
            Tab("Words", systemImage: "character.book.closed.fill") {
                WordGroupGridView()
            }
            Tab("Learn", systemImage: "book.fill") {
                LearnView(wordGroup: wordGroups.first!)
            }
        }
//        .fullScreenCover(isPresented: $isFirstOnboarding) {
//            OnboardingTabView(isFirstOnboarding: $isFirstOnboarding)
//        }
    }
}

#Preview {
    MainView()
}

//
//  MainView.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isFirstOnboarding") var isFirstOnboarding: Bool = true
    

    var body: some View {
        WordGroupGridView()
            .fullScreenCover(isPresented: $isFirstOnboarding) {
                OnboardingTabView(isFirstOnboarding: $isFirstOnboarding)
            }
    }
}

#Preview {
    MainView()
}

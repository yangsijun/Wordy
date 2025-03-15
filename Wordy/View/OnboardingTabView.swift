//
//  OnboardingTabView.swift
//  Wordy
//
//  Created by 양시준 on 3/16/25.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstOnboarding: Bool
    
    var body: some View {
        TabView {
            OnboardingPageView(
                imageName: "person.3.fill",
                title: "title 1",
                subtitle: "앱 설명 1",
                backgroundColor: .blue
            )
            OnboardingPageView(
                imageName: "note.text.badge.plus",
                title: "title 2",
                subtitle: "앱 설명 2",
                backgroundColor: .red
            )
            
            OnboardingLastPageView(
                imageName: "house",
                title: "title 3",
                subtitle: "앱 설명 3",
                backgroundColor: .green,
                isFirstOnboarding: $isFirstOnboarding
            )
        }
        .edgesIgnoringSafeArea(.all)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    OnboardingTabView(isFirstOnboarding: .constant(true))
}

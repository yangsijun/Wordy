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
                imageName: "character.book.closed.fill",
                title: "Welcome to Wordy!",
                subtitle: "Master British English vocabulary and boost your IELTS score with smart learning techniques.",
                foregroundColor: Color(red: 1/255, green: 33/255, blue: 105/255),
                backgroundColor: .white
            )
            OnboardingPageView(
                imageName: "waveform.circle.fill",
                title: "Learn words with British pronunciations!",
                subtitle: "Click on a word, definition, or example text to hear the British pronunciation.",
                foregroundColor: Color(red: 200/255, green: 16/255, blue: 46/255),
                backgroundColor: .white
            )
            OnboardingLastPageView(
                imageName: "brain.fill",
                title: "Boost Your Memory with Spaced Repetition",
                subtitle: "Review words at optimal intervals to reinforce long-term retention.\nLearn faster and forget less!",
                foregroundColor: Color(red: 1/255, green: 33/255, blue: 105/255),
                backgroundColor: .white,
                buttonTintColor:
                Color(red: 200/255, green: 16/255, blue: 46/255),
                buttonForegroundColor:
                        .white,
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

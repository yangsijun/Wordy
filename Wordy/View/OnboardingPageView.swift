//
//  OnboardingPageView.swift
//  Wordy
//
//  Created by 양시준 on 3/16/25.
//

import SwiftUI

struct OnboardingPageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    let foregroundColor: Color
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .padding()
            Text(title)
                .bold()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            Text(subtitle)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(foregroundColor)
        .background(backgroundColor)
    }
}

#Preview {
    OnboardingPageView(
        imageName: "character.book.closed.fill",
        title: "Welcome to Wordy!",
        subtitle: "Master British English vocabulary and boost your IELTS score with smart learning techniques.",
        foregroundColor: .white,
        backgroundColor: Color(red: 1/255, green: 33/255, blue: 105/255)
    )
}

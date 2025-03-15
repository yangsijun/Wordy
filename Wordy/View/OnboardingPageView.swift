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
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 100))
                .padding()
            Text(title)
                .bold()
                .font(.largeTitle)
                .padding()
            Text(subtitle)
                .font(.title2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}

#Preview {
    OnboardingPageView(imageName: "person.3.fill", title: "제목", subtitle: "설명", backgroundColor: .blue)
}

//
//  OnboardingLastPageView.swift
//  Wordy
//
//  Created by 양시준 on 3/16/25.
//

import SwiftUI

struct OnboardingLastPageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    let backgroundColor: Color
    
    @StateObject private var wordGroupViewModel: WordGroupViewModel = WordGroupViewModel(dataSource: .shared)
    @Binding var isFirstOnboarding: Bool
    
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
            
            Button {
                wordGroupViewModel.loadInitialData()
                isFirstOnboarding.toggle()
            } label: {
                Text("시작하기")
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}

#Preview {
    OnboardingLastPageView(imageName: "person.crop.circle", title: "제목", subtitle: "설명", backgroundColor: .green, isFirstOnboarding: .constant(true))
}

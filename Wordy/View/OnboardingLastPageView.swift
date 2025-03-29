//
//  OnboardingLastPageView.swift
//  Wordy
//
//  Created by 양시준 on 3/16/25.
//

import SwiftUI
import SwiftData

struct OnboardingLastPageView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \WordGroup.title) var wordGroups: [WordGroup]
    
    let imageName: String
    let title: String
    let subtitle: String
    let foregroundColor: Color
    let backgroundColor: Color
    let buttonTintColor: Color
    let buttonForegroundColor: Color
    
    @Binding var isFirstOnboarding: Bool
    @State private var isLoading = false
    
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
            if isLoading {
                ProgressView() // Shows an activity indicator
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
            } else {
                Button {
                    startLoadInitialData()
                    isFirstOnboarding.toggle()
                } label: {
                    Text("Let’s get started!")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .tint(buttonTintColor)
                .foregroundColor(buttonForegroundColor)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(foregroundColor)
        .background(backgroundColor)
    }
    
    func loadInitialData() async {
        let initialDataWordGroups = InitialDataLoader.getInitialDataWordGroups()
        
        for wordGroup in initialDataWordGroups {
            context.insert(wordGroup)
        }
        
        do {
            try context.save()
        } catch {
            print("Error saving initial data: \(error)")
        }
    }
    
    func startLoadInitialData() {
        isLoading = true

        Task {
            await loadInitialData()
            isLoading = false // Hide progress indicator after task completion
        }
    }
}

#Preview {
    OnboardingLastPageView(
        imageName: "house",
        title: "Boost Your Memory with Spaced Repetition",
        subtitle: "Review words at optimal intervals to reinforce long-term retention.\nLearn faster and forget less!",
        foregroundColor: .white,
        backgroundColor: Color(red: 1/255, green: 33/255, blue: 105/255),
        buttonTintColor: .white,
        buttonForegroundColor: Color(red: 200/255, green: 16/255, blue: 46/255),
        isFirstOnboarding: .constant(true)
    )
}

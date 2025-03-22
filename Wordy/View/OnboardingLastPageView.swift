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
    let backgroundColor: Color
    
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
                .padding()
            Text(subtitle)
                .font(.title2)
            if isLoading {
                ProgressView() // Shows an activity indicator
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
            } else {
                Button {
                    startLoadInitialData()
                    isFirstOnboarding.toggle()
                } label: {
                    Text("시작하기")
                        .bold()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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

//#Preview {
//    OnboardingLastPageView(imageName: "person.crop.circle", title: "제목", subtitle: "설명", backgroundColor: .green, isFirstOnboarding: .constant(true))
//}

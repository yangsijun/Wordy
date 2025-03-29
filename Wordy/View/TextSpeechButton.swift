//
//  TextSpeechButton.swift
//  Wordy
//
//  Created by 양시준 on 3/29/25.
//

import SwiftUI

struct TextSpeechButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            SpeechManager.shared.speak(text)
        }) {
            Text(text)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TextSpeechButton(text: "Hello World!")
        .font(.title)
        .bold()
}

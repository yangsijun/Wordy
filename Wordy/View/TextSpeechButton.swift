//
//  TextSpeechButton.swift
//  Wordy
//
//  Created by 양시준 on 3/29/25.
//

import SwiftUI

struct TextSpeechButton: View {
    var text: String
    var content: any View
    
    init(text: String) {
        self.text = text
        self.content = Text(text)
    }
    
    init(text: String, content: any View) {
        self.text = text
        self.content = content
    }
    
    var body: some View {
        Button(action: {
            SpeechManager.shared.speak(text)
        }) {
            AnyView(content)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TextSpeechButton(text: "Hello World!")
        .font(.title)
        .bold()
}

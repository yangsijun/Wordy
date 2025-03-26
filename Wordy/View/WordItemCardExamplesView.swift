//
//  WordItemCardExamplesView.swift
//  Wordy
//
//  Created by 양시준 on 3/25/25.
//

import SwiftUI
import SwiftData

struct WordItemCardExamplesView: View {
    var examples: [String] = []
    @State var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if isExpanded {
                Button(LocalizedStringKey("Hide examples"), systemImage: "chevron.up") {
                    isExpanded.toggle()
                }
                .buttonStyle(.plain)
                .foregroundColor(Color(UIColor.secondaryLabel))
            } else {
                Button(LocalizedStringKey("Show examples"), systemImage: "chevron.down") {
                    isExpanded.toggle()
                }
                .buttonStyle(.plain)
                .foregroundColor(Color(UIColor.secondaryLabel))
            }
            
            if isExpanded {
                ForEach(examples, id: \.self) { example in
                    Button(action: {
                        SpeechManager.shared.speak(example)
                    }) {
                        HStack(alignment: .top) {
                            Text("•")
                            Text(example)
                                .italic(true)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(1)
                }
            }
        }
    }
}

#Preview {
    WordItemCardExamplesView(
//        examples: [
//            "The baby had been abandoned by its mother.",
//            "People often simply abandon their pets when they go abroad.",
//            "‘We have been abandoned to our fate,’ said one resident.",
//            "The study showed a deep fear among the elderly of being abandoned to the care of strangers."
//        ]
        examples: [
            "We're going to call her Sophie.",
            "Please give her my regards.",
            "The manager will be free soon-you can wait for her here.",
            "That must be her now."
        ]
    )
}

//
//  SpeechManager.swift
//  Wordy
//
//  Created by 양시준 on 3/20/25.
//

import AVFoundation

class SpeechManager {
    static let shared = SpeechManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    
    private init() {}
    
    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        let voices = AVSpeechSynthesisVoice.speechVoices()
        utterance.voice = voices.first(where: { $0.language == "en-GB" && $0.name == "Jamie" && $0.quality == .premium}) ?? AVSpeechSynthesisVoice(language: "en-GB")        
        
        synthesizer.speak(utterance)
    }
}

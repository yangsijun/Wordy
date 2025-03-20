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
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        synthesizer.speak(utterance)
    }
}

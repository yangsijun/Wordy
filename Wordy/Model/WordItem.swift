//
//  WordItem.swift
//  Wordy
//
//  Created by 양시준 on 3/13/25.
//

import SwiftData

@Model
class WordItem: Decodable {
    @Attribute(.unique) var id: String
    var word: String
    var pos: String
    var phonetics: [String]
    @Relationship(deleteRule: .cascade) var senses: [WordSense]
    
    init(word_id: String, word: String, pos: String, phonetics: [String], senses: [WordSense]) {
        self.id = word_id
        self.word = word
        self.pos = pos
        self.phonetics = phonetics
        self.senses = senses
    }
    
    required init(from: Decoder) throws {
        id = try from.singleValueContainer().decode(String.self)
        pos = try from.singleValueContainer().decode(String.self)
        word = try from.singleValueContainer().decode(String.self)
        phonetics = try from.singleValueContainer().decode([String].self)
        senses = try from.singleValueContainer().decode([WordSense].self)
    }
}

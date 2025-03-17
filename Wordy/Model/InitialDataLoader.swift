//
//  InitialDataLoader.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftUI
import SwiftData

import Foundation

struct WordEntry: Decodable {
    let id: String
    let word: String
    let pos: String
    let phonetics: [String]
    let senses: [SenseEntry]
}

struct SenseEntry: Decodable {
    let id: String
    let group: [String]
    let cefr: String
    let meaning: String
    let examples: [String]
}

public struct InitialDataLoader {
    static func getInitialDataWordGroups() -> [WordGroup] {
        guard let url = Bundle.main.url(forResource: "oxford-words", withExtension: "json") else {
            print("Can not find oxford-words.json")
            return []
        }
        
        var initialData: [WordGroup] = []

        do {
            let jsonData = try Data(contentsOf: url)
            
            let words = try JSONDecoder().decode([WordEntry].self, from: jsonData)
            
            var ox3000Words: [WordItem] = []
            var ox5000Words: [WordItem] = []
            
            for word in words {
                var newWordSenses: [WordSense] = []
                
                for sense in word.senses {
                    newWordSenses.append(WordSense(id: sense.id, group: sense.group, cefr: sense.cefr, meaning: sense.meaning, examples: sense.examples))
                }
                
                let newWordItem = WordItem(id: word.id, word: word.word, pos: word.pos, phonetics: word.phonetics, senses: newWordSenses)
                
                for group in newWordSenses[0].group {
                    switch group {
                        case "ox3000":
                            ox3000Words.append(newWordItem)
                        case "ox5000":
                            ox5000Words.append(newWordItem)
                        default:
                            break
                    }
                }
            }
            
            let ox3000WordGroup = WordGroup(title: "Oxford 3000", words: ox3000Words)
            let ox5000WordGroup = WordGroup(title: "Oxford 5000", words: ox5000Words)
            
            print("JSON loaded successfully")
            initialData = [ox3000WordGroup, ox5000WordGroup]
        } catch {
            print("Failed to decode JSON: \(error)")
        }
        return initialData
    }
}

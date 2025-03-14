//
//  InitialDataLoader.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftUI
import SwiftData

public struct InitialDataLoader<T: Decodable> {
    static func loadJSONIfNeeded(context: ModelContext) {
        let existingWordsCount = (try? context.fetch(FetchDescriptor<WordItem>()))?.count ?? 0
        if existingWordsCount > 0 {
            print("Words already exist. No JSON loading needed.")
            return
        }
        
        guard let url = Bundle.main.url(forResource: "oxford-words", withExtension: "json") else {
            print("Can not find oxford-words.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let words = try decoder.decode([WordItem].self, from: data)
            
            var ox3000Words: [WordItem] = []
            var ox5000Words: [WordItem] = []
            
            for word in words {
                context.insert(word)
                for group in word.senses[0].group {
                    switch group {
                        case "ox3000":
                            ox3000Words.append(word)
                        case "ox5000":
                            ox5000Words.append(word)
                        default:
                            break
                    }
                }
            }
            
            context.insert(WordGroup(name: "Oxford 3000", words: ox3000Words))
            context.insert(WordGroup(name: "Oxford 5000", words: ox5000Words))
            
            print("JSON loaded successfully")
        } catch {
            print("JSON loading error: \(error)")
        }
    }
}

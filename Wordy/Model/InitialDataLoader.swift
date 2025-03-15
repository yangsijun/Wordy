//
//  InitialDataLoader.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftUI
import SwiftData

public struct InitialDataLoader {
    static func getInitialDataWordGroups() -> [WordGroup] {
        guard let url = Bundle.main.url(forResource: "oxford-words", withExtension: "json") else {
            print("Can not find oxford-words.json")
            return []
        }
        
        var initialData: [WordGroup] = []
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let words = try decoder.decode([WordItem].self, from: data)
            
            var ox3000Words: [WordItem] = []
            var ox5000Words: [WordItem] = []
            
            for word in words {
                for group in word.senses[0].group {
                    switch group {
                    case "Oxford 3000":
                        ox3000Words.append(word)
                    case "Oxford 5000":
                        ox5000Words.append(word)
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
            print("JSON loading error: \(error)")
        }
        return initialData
    }
}

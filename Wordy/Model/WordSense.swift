//
//  WordSense.swift
//  Wordy
//
//  Created by 양시준 on 3/14/25.
//

import SwiftData

@Model
class WordSense: Decodable {
    @Attribute(.unique) var id: String
    var group: [String]
    var cefr: String
    var meaning: String
    var examples: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case group
        case cefr
        case meaning
        case examples
    }
    
    init(id: String, group: [String], cefr: String, meaning: String, examples: [String] = []) {
        self.id = id
        self.group = group
        self.cefr = cefr
        self.meaning = meaning
        self.examples = examples
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        group = try container.decode([String].self, forKey: .group)
        cefr = try container.decode(String.self, forKey: .cefr)
        meaning = try container.decode(String.self, forKey: .meaning)
        examples = try container.decode([String].self, forKey: .examples)
    }
    
    func addExample(_ example: String) {
        self.examples.append(example)
    }
    
    func removeExample(at index: Int) {
        self.examples.remove(at: index)
    }
}

//
//  QuizGenerator.swift
//  Wordy
//
//  Created by 양시준 on 3/19/25.
//

struct QuizGenerator {
    static func generateMultipleChoiceMeaningQuiz(senses: [WordSense]) -> Quiz? {
        guard senses.count >= 4 else { return nil }

        let correctSense: WordSense = senses.randomElement()!
        let answer: String = correctSense.meaning
        var options: [String] = [correctSense.meaning]
        var optionWordList: [WordItem] = [correctSense.word!]

        while options.count < 4 {
            let randomSense = senses.randomElement()!
            let randomWord = randomSense.word!
            let randomMeaning = randomSense.meaning
            
            if !options.contains(randomMeaning) && !optionWordList.contains(randomWord) {
                options.append(randomMeaning)
                optionWordList.append(randomWord)
            }
        }

        options.shuffle()
        return Quiz(sense: correctSense, question: correctSense.word!.word, options: options, answer: answer, type: QuizType.multipleChoiceMeaning)
    }
    
    static func generateMultipleChoiceWordQuiz(senses: [WordSense]) -> Quiz? {
        guard senses.count >= 4 else { return nil }
        
        let correctSense: WordSense = senses.randomElement()!
        let answer: String = correctSense.word!.word
        var options: [String] = [correctSense.word!.word]
        
        while options.count < 4 {
            let randomSense = senses.randomElement()!
            let randomWordString = randomSense.word!.word
            
            if !options.contains(randomWordString){
                options.append(randomWordString)
            }
        }
        options.shuffle()
        return Quiz(sense: correctSense, question: correctSense.meaning, options: options, answer: answer, type: QuizType.multipleChoiceWord)
    }
}

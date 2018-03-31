//
//  Quiz.swift
//  swiftQuiz
//
//  Created by Lucas Santana Brito on 29/03/2018.
//  Copyright © 2018 Lucas Brito. All rights reserved.
//

import Foundation

class Quiz {
   
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateOption(_ index: Int) -> Bool {
        let anwser = options[index]
        return anwser == correctedAnswer
    }
    
    deinit {
        print("liberou quiz da memória")
    }
}

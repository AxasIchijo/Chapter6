//
//  QuestionData.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/28.
//

import Foundation

struct Questions: Codable {
    var questions: [QuestionData]
    
    // 複数のviewから参照したいのでClass定義
    class QuestionData: Codable {
        var questionNo: Int
        
        var title: String
        
        var choice1: String
        var choice2: String
        var choice3: String
        var choice4: String
        
        var answer: Int
        
        var userChoiceAnswerNumber: Int?
        
        func isCorrect() -> Bool {
            if answer == userChoiceAnswerNumber {
                return true
            }
            return false
        }
     }
}




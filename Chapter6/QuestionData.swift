//
//  QuestionData.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/28.
//

import Foundation

struct QuestionData {
    var title: String;
    
    var choice1: String;
    var choice2: String;
    var choice3: String;
    var choice4: String;
    
    var answer: Int;
    
    var userChoiceAnswerNumber: Int?
    
    var questionNo: Int = 0;
    
    func isCorrect() -> Bool {
        if answer == userChoiceAnswerNumber {
            return true;
        }
        return false;
    }
 }

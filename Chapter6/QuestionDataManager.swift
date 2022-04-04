//
//  QuestionDataManager.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/28.
//

import Foundation

class QuestionDataManager {
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [Questions.QuestionData]()
    
    var nowQuestionIndex: Int = 0
    
    private init() {
        // シングルトン保証用
    }
    
    func loadQuestion() {
        questionDataArray.removeAll()
        nowQuestionIndex = 0
        
        guard let jsonFilePath = Bundle.main.path(forResource: "question", ofType: "json") else {
            print("jsonファイルが存在しません")
            return
        }
        
        do {
            let jsonStringData = try String(contentsOfFile: jsonFilePath, encoding: String.Encoding.utf8)
            let rawData = jsonStringData.data(using: String.Encoding.utf8)!
            let decoder = JSONDecoder()
            guard let jsonData: Questions = try? decoder.decode(Questions.self, from: rawData) else {
                fatalError("Failed to decode from JSON.")
            }
            questionDataArray = jsonData.questions
        } catch let error {
            print("jsonファイル読み込みエラーが発生しました\(error)")
            return
        }
    }
    func nextQuestion() -> Questions.QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[safe: nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil;
    }
}

//
//  QuestionDataManager.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/28.
//

import Foundation

class QuestionDataManager {
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    
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
            let jsonData =  try JSONSerialization.jsonObject(with: rawData) as! Dictionary<String,[Dictionary<String, Any>]>
            let questions = jsonData["questions"]
            questions?.forEach({ question in
                let data = QuestionData(title: question["title"] as! String,
                                        choice1: question["choice1"] as! String,
                                        choice2: question["choice2"] as! String,
                                        choice3: question["choice3"] as! String,
                                        choice4: question["choice4"]as! String,
                                        answer: question["answer"]as! Int);
                questionDataArray.append(data)
            })
            
            
        } catch let error {
            print("jsonファイル読み込みエラーが発生しました\(error)")
            return
        }
    }
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil;
    }
}

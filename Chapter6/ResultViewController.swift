//
//  resultViewController.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/30.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questions = QuestionDataManager.sharedInstance.questionDataArray
        
        let questionCount = questions.count
        
        var correctCount = 0
        for questionData in questions {
            if questionData.isCorrect() {
                correctCount += 1
            }
        }
        
        let percentage = (Float(correctCount) / Float(questionCount)) * 100
        
        correctPercentLabel.text = String(format: "%.1f", percentage) + "%"
    }
}

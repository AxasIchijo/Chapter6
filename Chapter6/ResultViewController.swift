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
        
        let questionCount = Float(questions.count)
        let correctCount = Float(questions.filter { $0.isCorrect() }.count)
        
        let percentage = (correctCount / questionCount) * 100
        
        correctPercentLabel.text = String(format: "%.1f", percentage) + "%"
    }
}

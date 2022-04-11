//
//  ViewController.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuestionDataManager.sharedInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as? QuestionViewController else {
            return
        }
        
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            return
        }
        
        nextViewController.questionData = questionData
    }
    
    @IBAction func gotoTitle(_ sender: UIStoryboardSegue) {
    }
}


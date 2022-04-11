//
//  QuestionViewController.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/03/28.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionNo: UILabel!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var correct: UIImageView!
    @IBOutlet weak var incorrect: UIImageView!
    
    var questionData: Questions.QuestionData!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionNo.text = "Q.\(questionData.questionNo)"
        question.text = questionData.title
        answer1.setTitle(questionData.choice1, for: UIControl.State.normal)
        answer2.setTitle(questionData.choice2, for: UIControl.State.normal)
        answer3.setTitle(questionData.choice3, for: UIControl.State.normal)
        answer4.setTitle(questionData.choice4, for: UIControl.State.normal)
    }
    
    @IBAction func tapAnswer(_ sender: UIButton) {
        questionData.userChoiceAnswerNumber = sender.tag
        goNextQuestionWithAnimation()
    }
    
    func goNextQuestionWithAnimation() {
        if(questionData.isCorrect()) {
            correctAnimation()
        } else {
            incorrectAnimation()
        }
    }
    
    func correctAnimation() {
        AudioServicesPlayAlertSound(1025)
        
        UIView.animate(withDuration: 2.0, animations: {
            [weak self] in
            self?.correct.alpha = 1.0
        }) { [weak self] _ in
            self?.goNextQuestion()
        }
    }
    
    func incorrectAnimation() {
        AudioServicesPlayAlertSound(1006)
        
        UIView.animate(withDuration: 2.0, animations: {
            [weak self] in
            self?.incorrect.alpha = 1.0
        }) { [weak self] _ in
            self?.goNextQuestion()
        }
    }
    
    func goNextQuestion() {
        guard let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion() else {
            // 次の質問が存在しない場合は結果画面
            if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                present(resultViewController, animated: true, completion: nil)
            }
            return
        }
        
        // 次の質問へ
        if let nextQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            nextQuestionViewController.questionData = nextQuestion
            
            present(nextQuestionViewController, animated: true, completion: nil)
        }
    }
}

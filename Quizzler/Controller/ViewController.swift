//
//  ViewController.swift
//  Quizzler
//
//  Created by Valery Keplin on 8.06.22.
//

import UIKit

var quizBrain = QuizBrain()

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userGotItRight = quizBrain.checkAnswer(sender.currentTitle!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.score)"
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAnswerText()
        self.choiceOneButton.setTitle(answerChoices[0], for: .normal)
        self.choiceTwoButton.setTitle(answerChoices[1], for: .normal)
        self.choiceThreeButton.setTitle(answerChoices[2], for: .normal)
        self.choiceOneButton.backgroundColor = UIColor.clear
        self.choiceTwoButton.backgroundColor = UIColor.clear
        self.choiceThreeButton.backgroundColor = UIColor.clear
        progressView.progress = quizBrain.getProgress()
    }
}

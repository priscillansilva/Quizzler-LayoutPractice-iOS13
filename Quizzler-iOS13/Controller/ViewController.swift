//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var q1button: UIButton!
    @IBOutlet weak var q2button: UIButton!
    @IBOutlet weak var q3button: UIButton!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func onPressedChoice(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let isRigth = quizBrain.checkAnswer(userAnswer!)

        if isRigth {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.updateQuizCount()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        q1button.setTitle(quizBrain.getAnswers()[0], for: .normal)
        q2button.setTitle(quizBrain.getAnswers()[1], for: .normal)
        q3button.setTitle(quizBrain.getAnswers()[2], for: .normal)
        progressBar.progress = quizBrain.getQuizProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        q1button.backgroundColor = UIColor.clear
        q2button.backgroundColor = UIColor.clear
        q3button.backgroundColor = UIColor.clear
    }
    
}


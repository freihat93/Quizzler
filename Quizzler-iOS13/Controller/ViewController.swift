//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var Chouce1: UIButton!
    @IBOutlet weak var Chouce2: UIButton!
    @IBOutlet weak var Chouce3: UIButton!
    
    
   
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True, Fales
        //let actualAnswer = quiz[qusetionNumber].answer
        let userGotItRight = quizBrain.checkAnswer (userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLable.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLable.text = "Score: \(quizBrain.getScore())"
        Chouce1.backgroundColor = UIColor.clear
        Chouce2.backgroundColor = UIColor.clear
        Chouce3.backgroundColor = UIColor.clear
        
        Chouce1.setTitle((quizBrain.buttonTitle()[0]), for: .normal)
        Chouce2.setTitle(quizBrain.buttonTitle()[1], for: .normal)
        Chouce3.setTitle(quizBrain.buttonTitle()[2], for: .normal)
    }
}


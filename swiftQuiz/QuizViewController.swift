//
//  QuizViewController.swift
//  swiftQuiz
//
//  Created by Lucas Santana Brito on 29/03/2018.
//  Copyright © 2018 Lucas Brito. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    
    @IBOutlet weak var viTimer: UIView!
    
    @IBOutlet weak var lbQuest: UILabel!
    
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 20.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = self.view.frame.size.width/2
        }) { (success) in
            self.showResults()
        }
        quizManager.refreshValues()
        getNewQuiz()
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuest.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewcontroller = segue.destination as! ResultViewController
        resultViewcontroller.totalAnswers = quizManager.totalAnswers
        resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnwsers(index: index)
        getNewQuiz()
    }
    
   
}

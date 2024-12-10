//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 10.12.2024.
//

import UIKit
import Foundation

final class MovieQuizPresenter {
    
   let questionsAmount: Int = 10
 var currentQuestionIndex: Int = 0
    
    func isLastQuestion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
    }
    func resetQuestionIndex() {
        currentQuestionIndex = 0
    }
    func switchToNextQuestion() {
        currentQuestionIndex += 1
    }
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        QuizStepViewModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
       
    }
    
}

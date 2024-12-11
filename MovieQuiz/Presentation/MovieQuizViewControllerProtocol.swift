//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 11.12.2024.
//

import Foundation
import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
    func showLoadingIndicator()
     func hideLoadingIndicator()
     func showNetworkError(message: String)
     func show(quiz: QuizStepViewModel)
     func show(quiz: QuizResultsViewModel)
     func blockStateOfButton()
     func unlockStateOfButton()
     func highlightImageBorder(isCorrectAnswer: Bool)
    var imageView: UIImageView! { get }
}

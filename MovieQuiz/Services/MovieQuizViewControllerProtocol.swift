//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 11.12.2024.
//

import Foundation
import UIKit

protocol MovieQuizViewControllerProtocol {
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
    func highlightImageBorder(isCorrectAnswer: Bool)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showNetworkError(message: String)
}

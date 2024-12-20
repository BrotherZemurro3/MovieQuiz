//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 10.11.2024.
//
import Foundation
import UIKit

// MARK: - QuestionFactoryDelegateProtocol
protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer() // сообщение об успешной загрузке
    func didFailToLoadData(with error: Error)
}

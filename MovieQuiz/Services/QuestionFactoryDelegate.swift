//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 10.11.2024.
//
import Foundation
import UIKit

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    
}

//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 07.11.2024.
//
import Foundation
import UIKit

// MARK: - QuestionFactory

public class QuestionFactory: QuestionFactoryProtocol {
    
    weak var delegate: QuestionFactoryDelegate?
    
// MARK: - QuestionFactoryInitializer
   init(delegate: QuestionFactoryDelegate) {
       self.delegate = delegate
    }

// MARK: - ArrayOfQuizQuestions
    let questions: [QuizQuestion] = [
        
       QuizQuestion(
           image: "The Godfather",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: true),
       QuizQuestion(
           image: "The Dark Knight",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: true),
       QuizQuestion(
           image: "Kill Bill",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: true),
       QuizQuestion(
           image: "The Avengers",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: true),
       QuizQuestion(
           image: "Deadpool",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: true),
       QuizQuestion(
           image: "The Green Knight",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: true),
       QuizQuestion(
           image: "Old",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: false),
       QuizQuestion(
           image: "The Ice Age Adventures of Buck Wild",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: false),
       QuizQuestion(
           image: "Tesla",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: false),
       QuizQuestion(
           image: "Vivarium",
           text: "Рейтинг данного фильма больше чем 6?",
           correctAnswer: false)
   ]
    
    // MARK: - requestNextQuestion
    func requestNextQuestion() {
        guard let index = (0..<questions.count).randomElement() else {
            delegate?.didReceiveNextQuestion(question: nil)
            return
        }
        let question = questions[safe: index]
        delegate?.didReceiveNextQuestion(question: question
        )
    }

    
     
}

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
    private let moviesLoader: MoviesLoading
    private weak var delegate: QuestionFactoryDelegate?
    
// MARK: - QuestionFactoryInitializer
    init(moviesLoader: MoviesLoading, delegate: QuestionFactoryDelegate?){
        self.moviesLoader = moviesLoader
        self.delegate = delegate
    }

// MARK: - ArrayOfQuizQuestions
 /*   let questions: [QuizQuestion] = [
        
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
    */
    
    private var movies: [MostPopularMovies] = []
    
    func loadData() {
        moviesLoader.loadMovies { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let mostPopularMovies):
                self.movies = mostPopularMovies.items // сохраняем фильм в нашу новую переменную
                self.delegate?.didLoadDataFromServer() // сообщаем, что данные загрузились
            case .failure(let error):
                self.delegate?.didFailToLoadData(with: error) // сообщаем об ошибке нашему MovieQuizViewController
            }
    }
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

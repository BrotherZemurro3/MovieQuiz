//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 07.11.2024.
//

import UIKit
import Foundation


// MARK: - QuizQuestion

struct QuizQuestion {
    let image: Data
    let text: String
    let correctAnswer: Bool
}
let imageData = try Data(contentsOf: imageURL )
let image = UIImage(data: imageData)



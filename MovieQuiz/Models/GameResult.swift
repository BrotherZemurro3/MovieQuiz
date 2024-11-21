//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 19.11.2024.
//

import UIKit
import Foundation


// MARK: - GameResult

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    // MARK: - isbetterThanAnother
    
    func isbetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
    
}

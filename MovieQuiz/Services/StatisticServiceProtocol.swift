//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 19.11.2024.
//

import UIKit
import Foundation

// MARK: - StatisticServiceProtocol
protocol StatisticServiceProtocol {
    var gamesCount: Int {get}
    var bestGame: GameResult {get}
    var totalAccuracy: Double {get}
    
    func store(correct count: Int, total amount: Int)
}



//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 18.11.2024.
//

import Foundation
import UIKit


// MARK: - AlertModel
struct AlertModel {
    let tittle: String
    let message: String
    let buttonText: String
    let completion: (() -> Void)?
    
}

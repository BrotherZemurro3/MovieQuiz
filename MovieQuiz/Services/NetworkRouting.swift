//
//  NetworkRouting.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 08.12.2024.
//


import Foundation
import UIKit

protocol NetworkRouting {
    func fetch (url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}

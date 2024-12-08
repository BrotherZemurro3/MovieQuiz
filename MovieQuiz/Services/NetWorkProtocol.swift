//
//  NetWorkProtocol.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 07.12.2024.
//

import UIKit
import Foundation

protocol NetworkRouting {
    func fetch (url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}

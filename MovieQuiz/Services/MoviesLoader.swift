//
//  MoviesLoader.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 05.12.2024.
//

import UIKit
import Foundation

protocol MoviesLoading {
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}

struct MoviesLoader: MoviesLoading {
    //MARK: - NetWorkClient
    private let networkClient = NetworkClient()
    //MARK: - URL
    private var mostPopularMoviesUrl: URL {
        // Если не смогли преобразовать строку в URL, то приложение упадёт с ошибкой
        guard let url = URL(string: "https://tv-api.com/en/API/Top250Movies/k_zcuw1ytf") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }
    
    func loadMovies(handler: @escaping (Result<MostPopularMovies, any Error>) -> Void) {
        networkClient.fetch(url: mostPopularMoviesUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let mostPopularMovies = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                    
                    let errorMessage = mostPopularMovies.errorMessage
                    if !errorMessage.isEmpty {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                        handler(.failure(error))
                        
                    }
                    handler(.success(mostPopularMovies))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(. failure(error))
            }
        }
        
    }
}
//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 18.11.2024.
//

import Foundation
import UIKit

// MARK: - AlertPresenter
class AlertPresenter {
    private weak var viewController: UIViewController?
    private let presenter: MovieQuizPresenter
    // MARK: - Initializer
    init(viewController: UIViewController, presenter: MovieQuizPresenter) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    
    // MARK: - Public Methods
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(title: model.tittle,
                                      message: model.message,
                                      preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: model.buttonText,
                                   style: .default) {_ in model.completion?()
            self.presenter.restartGame()
            
        }
        
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}

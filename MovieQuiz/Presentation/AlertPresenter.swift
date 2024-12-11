//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Дионисий Коневиченко on 18.11.2024.
//

import Foundation
import UIKit

class AlertPresenter {
    private weak var viewController: UIViewController?
    private let presenter: MovieQuizPresenter
    
    init(viewController: UIViewController, presenter: MovieQuizPresenter) {
        self.viewController = viewController
        self.presenter = presenter
    }
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

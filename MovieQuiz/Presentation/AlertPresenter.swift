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
    
    // MARK: - Initializer
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    
    // MARK: - Public Methods
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(title: model.tittle, message: model.message, preferredStyle: .alert)
    
      
    let action = UIAlertAction(title: model.buttonText, style: .default) {_ in model.completion?()
    }
        
    alert.addAction(action)
    viewController?.present(alert, animated: true, completion: nil)
}
}

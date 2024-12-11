import UIKit
import Foundation

// MARK: - MovieQuizViewController


final class MovieQuizViewController: UIViewController {
    
    private var presenter: MovieQuizPresenter!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MovieQuizPresenter(viewController: self)
        imageView.layer.cornerRadius = 20
        
    }
    
    // MARK: - IB Outlets
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak private var questionTitle: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - IB Actions
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        blockStateOfButton()
        presenter.yesButtonClicked()
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        blockStateOfButton()
        presenter.noButtonClicked()
    }
    

    // MARK: - stateOfButtons
    
     func blockStateOfButton() {
        yesButton.isEnabled = false
        noButton.isEnabled = false
    }
    
    func unlockStateOfButton() {
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }
    
    // MARK: - Private Methods
    func showLoadingIndicator() {
        activityIndicator.isHidden = false // говорим, что индикатор загрузки не скрыт
        activityIndicator.startAnimating() // включаем анимацию
    }
    func changeStateButton(isEnabled: Bool) {
        noButton.isEnabled = isEnabled
        yesButton.isEnabled = isEnabled
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    private func setupViews() {
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
    }
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func show(quiz result: QuizResultsViewModel) {
        let message = presenter.makeResultsMessage()
        
        let alert = UIAlertController(
            title: result.title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            self.presenter.restartGame()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func showNetworkError(message: String) {
         hideLoadingIndicator()

         let alert = UIAlertController(
             title: "Ошибка",
             message: message,
             preferredStyle: .alert)

             let action = UIAlertAction(title: "Попробовать ещё раз",
             style: .default) { [weak self] _ in
                 guard let self = self else { return }

                 self.presenter.restartGame()
             }

         alert.addAction(action)
     }
 }
    


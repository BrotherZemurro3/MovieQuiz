import UIKit

final class MovieQuizViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        show(quiz: convert(model:questions[currentQuestionIndex]))
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 20
        
    }
    
    // MARK: - IB Outlets
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var questionTitle: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    
    
    
    // MARK: Private Properties
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: false)
    ]
    
    private var currentQuestionIndex = 0
    private var correctAnswers = 0

    private struct QuizQuestion {
        let image: String
        let text: String
        let correctAnswer: Bool
    }
    private struct QuizStepViewModel {
        let image: UIImage
        let question: String
        let questionNumber: String
    }
    private struct QuizResultsViewModel {
        let title: String
        let text: String
        let buttonText: String
    }
    
    
    // MARK: - IB Actions
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex] // 1
        let givenAnswer = true // 2
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer) // 3
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex] // 1
        let givenAnswer = false // 2
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer) // 3
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
    }
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    private func showAnswerResult(isCorrect: Bool) {
        changeStateButton(isEnabled: false)
        if isCorrect {
            correctAnswers += 1
        }
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showNextQuestionOrResults()
        }
    }
    private func showNextQuestionOrResults() {
        changeStateButton(isEnabled: true)
        if currentQuestionIndex == questions.count - 1 {
            let text = "Ваш результат: \(correctAnswers)/10"
            let viewModel = QuizResultsViewModel(
                title: "Этот раунд окончен!",
                text: text,
                buttonText: "Сыграть ещё раз")
            show(quiz: viewModel)
            imageView.layer.borderWidth = 0
            imageView.layer.borderColor = UIColor.clear.cgColor
        } else {
            currentQuestionIndex += 1
            
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
            
            show(quiz: viewModel)
            imageView.layer.borderWidth = 0
            imageView.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(title: result.title,
                                      message: result.text,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.currentQuestionIndex = .zero
            self.correctAnswers = .zero
            
            let firstQuestion = self.questions[self.currentQuestionIndex]
            let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    private func changeStateButton(isEnabled: Bool) {
        noButton.isEnabled = isEnabled
        yesButton.isEnabled = isEnabled
    }
}



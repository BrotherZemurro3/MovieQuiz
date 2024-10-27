import UIKit

final private class MovieQuizViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        show(quiz: convert(model:questions[currentQuestionIndex]))
    }
    
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        let givenAnswer = true
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        let givenAnswer = false
        
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
    }
    
    let alert = UIAlertController(
        title: "Этот раунд окончен!",
        message: "Ваш результат ???",
        preferredStyle: .alert)

    
    
    
    struct QuizQuestion {
        // строка с названием фильма,
        // совпадает с названием картинки афиши фильма в Assets
        let image: String
        // строка с вопросом о рейтинге фильма
        let text: String
        // будевое значение (true, false, правильный ответ на вопрос)
        let correctAnswer: Bool
    }
    struct QuizStepViewModel {
        // картинка с афишей фильма с типом UIImage
        let image: UIImage
        // вопрос о рейтинге квиза
        let question: String
        // строка с порядковым номером этого вопроса (ex. 1/10)
        let questionNumber: String
    }
    struct QuizResultsViewModel {
        // строка с заголовком алерта
        let title: String
        // строка с текстом о количестве набранных очков
        let text: String
        // текст для кнопки алерта
        let buttonText: String
    }
    
   
    // массив вопросов
    private let questions: [QuizQuestion] =  [
        QuizQuestion(image: "The Godfater", text: "Рейтинг этого фильма большем чем 6", correctAnswer: true),
        QuizQuestion(image: "The Dark Knight", text: "Рейтинг этого фильма большем чем 6", correctAnswer: true),
        QuizQuestion(image: "Kill Bill", text: "Рейтинг этого фильма большем чем 6", correctAnswer: true),
        QuizQuestion(image: "The Avengers", text: "Рейтинг этого фильма большем чем 6", correctAnswer: true),
        QuizQuestion(image: "Deadpool", text: "Рейтинг этого фильма большем чем 6", correctAnswer: true),
        QuizQuestion(image: "The Green Knight", text: "Рейтинг этого фильма большем чем 6", correctAnswer: true),
        QuizQuestion(image: "Old", text: "Рейтинг этого фильма большем чем 6", correctAnswer: false),
        QuizQuestion(image: "The Ice Age Adventures of Buck wild", text: "Рейтинг этого фильма большем чем 6", correctAnswer: false),
        QuizQuestion(image: "Tesla", text: "Рейтинг этого фильма большем чем 6", correctAnswer: false),
        QuizQuestion(image: "Vivarium", text: "Рейтинг этого фильма большем чем 6", correctAnswer: false)
    ]
    
    private func show(quiz step: QuizStepViewModel){
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
         
    }
    private func showNextQuestionOrResults() {
        if currentQuestionIndex == questions.count - 1 {
            let text = "Ваш результат: \(correctAnswers)/10"
            let viewModel = QuizResultsViewModel(title: "Этот раунд окончен", text: text, buttonText: "Сыграть еще раз")
            show(quiz: viewModel)
            
        } else {
            currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
          
            show(quiz: viewModel)
            }
    }
private func showAnswerResult(isCorrect: Bool) {
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
 
    private func convert (model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.image) ?? UIImage(), question: model.text, questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
    let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
        self.currentQuestionIndex = 0
        // сбрасываем переменную с количеством правильных ответов
        self.correctAnswers = 0
        
        // заново показываем первый вопрос
        let firstQuestion = self.questions[self.currentQuestionIndex]
        let viewModel = self.convert(model: firstQuestion)
        self.show(quiz: viewModel)
    }

    alert.addAction(action)

    self.present(alert, animated: true, completion: nil)
    }
}


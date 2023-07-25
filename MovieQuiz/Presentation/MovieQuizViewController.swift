import UIKit

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func highlightImageBorder(isCorrectAnswer: Bool)
    func showLoadingIndicator()
    func showNetworkError(message: String)
    func workButton()
    func hideLoadingIndicator()
    func disButton()
    func showFinalResults(alertModel: AlertModel)
}

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol  {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet private var noButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var alertPresenter: AlertPresenter?
    private var presenter: MovieQuizPresenter!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        alertPresenter = AlertPresenterImpl(viewController: self)
        presenter = MovieQuizPresenter(viewController: self)
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ?  UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    @IBAction private func yesButtonClicked(_ sender: Any) {
        presenter.yesButtonClicked()
    }
    @IBAction private func noButtonClicked(_ sender: Any) {
        presenter.noButtonClicked()
    }
    
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    func showFinalResults(alertModel: AlertModel) {
        activityIndicator.isHidden = true
        alertPresenter?.show(alertModel: presenter.newAlert())
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func disButton(){
        yesButton.isEnabled = false
        noButton.isEnabled = false
    }
    
    func showNetworkError(message: String) {
        showLoadingIndicator()
        
        let model = AlertModel(title: "Ошибка",
                               message: message,
                               buttonText: "Попробовать еще раз") { [weak self] in
            guard let self = self else { return }
            
            self.presenter.restartGame()
        }
        
        alertPresenter?.show( alertModel: model)
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    func workButton(){
        yesButton.isEnabled = true
        noButton.isEnabled = true
        showLoadingIndicator()
    }
}

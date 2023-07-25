//
//  MovieQuizViewControllerMock.swift
//  MovieQuizViewControllerMock
//
//  Created by Андрей Назаркин on 24.07.2023.
//
import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    
    func show(quiz step: MovieQuiz.QuizStepViewModel) {
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
    }
    
    func showLoadingIndicator() {
    }
    
    func showNetworkError(message: String) {
    }
    
    func workButton() {
    }
    
    func hideLoadingIndicator() {
    }
    
    func disButton() {
    }
    
    func showFinalResults(alertModel: MovieQuiz.AlertModel) {
    }
}
 

//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Андрей Назаркин on 19.06.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}

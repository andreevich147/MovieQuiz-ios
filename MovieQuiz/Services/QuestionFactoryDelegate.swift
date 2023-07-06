//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Андрей Назаркин on 19.06.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer() // сообщение об успешной загрузке
     func didFailToLoadData(with error: Error) // сообщение об ошибке загрузки
}

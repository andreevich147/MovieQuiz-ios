//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Андрей Назаркин on 19.06.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
}

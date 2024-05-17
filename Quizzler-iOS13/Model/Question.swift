//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mohammad on 3/30/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    let choice : [String]
    
    init(q:String, a: [String], correctAnswer: String) {
        text = q
        choice = a
        answer = correctAnswer
    }
}

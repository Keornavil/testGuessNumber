//
//  EventHistory.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 30.04.2022.
//

import Foundation
import UIKit

class EventHistory {
    
var  guesser = 0, guessedNumber = 0, enteredNumber = 0, attemptNumberUser = 0,attemptNumberComputer = 0, leftBorder = 0, rightBorder = 100
    
    static let shared = EventHistory()
    private init() {}
    
    func defaultValue() {
        guesser = 0
        guessedNumber = 0
        enteredNumber = 0
        attemptNumberUser = 0
        attemptNumberComputer = 0
        leftBorder = 0
        rightBorder = 100
    }
    
    func compareValue(label: UILabel) {
        if EventHistory.shared.enteredNumber > EventHistory.shared.guessedNumber {
            label.text = "Загаданное число меньше"
            EventHistory.shared.attemptNumberUser += 1
        } else if EventHistory.shared.enteredNumber < EventHistory.shared.guessedNumber {
            label.text = "Загаданное число больше"
            EventHistory.shared.attemptNumberUser += 1
        } else if EventHistory.shared.enteredNumber == EventHistory.shared.guessedNumber {
            EventHistory.shared.attemptNumberUser += 1
            label.text = "Вы угадали число, вам потребовалось \(EventHistory.shared.attemptNumberUser) попыток"
            //EventHistory.shared.guesser = 1
            
        }
    }
    
    func binValue() -> Int {
        
        let s = EventHistory.shared.rightBorder - EventHistory.shared.leftBorder
        let d = EventHistory.shared.rightBorder - s/2
        
        return d
    }
}


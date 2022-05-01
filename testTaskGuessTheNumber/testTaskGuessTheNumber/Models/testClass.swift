//
//  testClass.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 29.04.2022.
//

import Foundation

class TestClass {
    var a: Int
    var b: Int
    
    func sum() -> Int {
        let sum = a + b
        return sum
    }
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

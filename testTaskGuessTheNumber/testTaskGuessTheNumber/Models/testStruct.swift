//
//  testStruct.swift
//  testTaskGuessTheNumber
//
//  Created by Василий Максимов on 29.04.2022.
//

import Foundation

struct TestStruct {
    var a = 0
    var b = 2
    
    mutating func inc() {
        a = a + b
    }
}

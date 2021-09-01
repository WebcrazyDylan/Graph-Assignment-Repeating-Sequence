//
//  main.swift
//  Graph-Assignment-Repeating-Sequence
//
//  Created by Dylan Park on 2021-08-15.
//

import Foundation

func repeatingSequence() {
    print("Please input for Repeating Sequence")
    let getInput = readLine()!.split(separator: " ").map { Int($0) }
    let firstNumber = getInput[0]!
    let exponent = getInput[1]!
    var alreadyAppearedNumber: Set = [firstNumber]
    var sequence: [Int] = [firstNumber]
    
    var currentNumber: Int = firstNumber
    var nextNumber: Int = 0
    var notLoopYet: Bool = true
    var count = 0
    while(notLoopYet) {
        while(currentNumber != 0) {
            nextNumber += Int(pow(Double(currentNumber % 10), Double(exponent)))
            currentNumber = (currentNumber - currentNumber % 10) / 10
        }
        if alreadyAppearedNumber.contains(nextNumber) {
            notLoopYet = false
            count = sequence.firstIndex(of: nextNumber)!
        }
        alreadyAppearedNumber.insert(nextNumber)
        sequence.append(nextNumber)
        currentNumber = nextNumber
        nextNumber = 0
    }
    print(count)
}

repeatingSequence()

/*
 Sample Input 1
57 2
 Sample Output 1
4
 */

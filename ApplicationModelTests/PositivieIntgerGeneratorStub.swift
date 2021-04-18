//
//  PositivieIntgerGeneratorStub.swift
//  ApplicationModelTests
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation
import ApplicationModel

class PositivieIntgerGeneratorStub: PositiveIntegerGenerator {
    
    let numbers: [Int]
    private var index: Int
    
    convenience init(
        _ numbers: Int...
    ) {
        self.init(numbers)
    }
    
    init(
        _ numbers: [Int]
    ) {
        self.numbers = numbers
        self.index = 0
    }
    
    func generateLessThanOrEqualToHundread() -> Int {
        let number = self.numbers[self.index]
        self.index = (self.index + 1) % self.numbers.count
        return number
    }
}

//
//  RandomGenerator.swift
//  Application
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation
import ApplicationModel

public final class RandomGenerator: PositiveIntegerGenerator {
    
    public func generateLessThanOrEqualToHundread() -> Int {
        Int.random(in: 1...100)
    }
}

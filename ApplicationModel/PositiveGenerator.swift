//
//  PositiveGenerator.swift
//  NumberGuessing
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation
 
/// 정수값을 생성하는 protocol
public protocol PositiveIntegerGenerator {
    
    func generateLessThanOrEqualToHundread() -> Int
}

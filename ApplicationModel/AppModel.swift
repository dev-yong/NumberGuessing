//
//  AppModel.swift
//  NumberGuessing
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation
import Auxiliary

/// Game Application이 수행해야할 모형을 담고 있다.
/// Game Loop를 지원하는데 필요한 인터페이스를 제공한다.
public final class AppModel {
    
    public init(
        generator: PositiveIntegerGenerator
    ) {
        self.isCompleted = false
    }
    
    public private(set) var isCompleted: Bool
    
    @discardableResult
    public func flushOutput() -> String? {
        return "1: Single player game" + String.newLine + "2: Multiplayer game" + .newLine + "3: Exit" + .newLine + "Enter selection: "
    }
    
    public func process(
        input: String
    ) {
        if input == "3" {
            self.isCompleted = true
        }
    }
}

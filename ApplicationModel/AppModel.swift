//
//  AppModel.swift
//  NumberGuessing
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation

/// Game Application이 수행해야할 모형을 담고 있다.
/// Game Loop를 지원하는데 필요한 인터페이스를 제공한다.
public final class AppModel {
    
    public init(
        generator: PositiveIntegerGenerator
    ) {
        
    }
    
    public var isCompleted: Bool {
        true
    }
    
    public func flushOutput() -> String? {
        nil
    }
    
    public func process(
        input: String
    ) {
        
    }
}

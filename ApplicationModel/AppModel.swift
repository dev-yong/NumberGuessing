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
        self.output = "1: Single player game" + String.newLine + "2: Multiplayer game" + .newLine + "3: Exit" + .newLine + "Enter selection: "
        self.answer = generator.generateLessThanOrEqualToHundread()
        self.isSinglePlayerMode = false
    }
    
    private var output: String
    private var answer: Int
    private var isSinglePlayerMode: Bool
    public private(set) var isCompleted: Bool
    
    @discardableResult
    public func flushOutput() -> String? {
        return self.output
    }
    
    public func process(
        input: String
    ) {
        if self.isSinglePlayerMode {
            self.processingSinglePlayerGame(input)
        } else {
            processModeSelection(input)
        }
    }
    
    private func processingSinglePlayerGame(
        _ input: String
    ) {
        guard let guess = Int(input) else { return }
        if guess < self.answer {
            self.output = "Your guess is too low." + .newLine + "Enter your guess: "
        } else if guess > self.answer {
            self.output = "Your guess is too high." + .newLine + "Enter your guess: "
        } else {
            self.output = "Correct! "
        }
    }
    
    private func processModeSelection(_ input: String) {
        if input == "1" {
            self.isSinglePlayerMode = true
            self.output = "Single player game" + .newLine + "I'm thinking of a number between 1 and 100." + .newLine + "Enter youer guess: "
        } else {
            self.isCompleted = true
        }
    }
}

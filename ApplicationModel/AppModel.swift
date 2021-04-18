//
//  AppModel.swift
//  NumberGuessing
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation
import Auxiliary

final class Processor {
    
    init(
        _ closure: ((String) -> Processor)?
    ) {
         self.closure = closure
     }

     private let closure: ((String) -> Processor)?

     func run(input: String) -> Processor {
        return self.closure?(input) ?? Processor(nil)
     }
    
 }

/// Game Application이 수행해야할 모형을 담고 있다.
/// Game Loop를 지원하는데 필요한 인터페이스를 제공한다.
public final class AppModel {
    
    private static let selectModeMessage = "1: Single player game" + String.newLine + "2: Multiplayer game" + .newLine + "3: Exit" + .newLine + "Enter selection: "
    
    public init(
        generator: PositiveIntegerGenerator
    ) {
        self.generator = generator
        self.isCompleted = false
        self.output = Self.selectModeMessage
        self.isSinglePlayerMode = false
        self.tries = 0
    }
    
    private let generator: PositiveIntegerGenerator
    public private(set) var isCompleted: Bool
    private var output: String
    private var isSinglePlayerMode: Bool
    private var tries: Int
    private lazy var processor: Processor = Processor(self.processModeSelection)
    
    @discardableResult
    public func flushOutput() -> String {
        return self.output
    }
    
    public func process(
        input: String
    ) {
        self.processor = self.processor.run(input: input)
    }

    private func processModeSelection(_ input: String) -> Processor {
        if input == "1" {
            self.isSinglePlayerMode = true
            self.output = "Single player game" + .newLine + "I'm thinking of a number between 1 and 100." + .newLine + "Enter youer guess: "
            
            return self.singlePlayerGameProcessor(
                answer: self.generator.generateLessThanOrEqualToHundread(),
                tries: 1
            )
        } else {
            self.isCompleted = true
            return Processor(nil)
        }
    }
    
    private func singlePlayerGameProcessor(
        answer: Int,
        tries: Int
    ) -> Processor {
        return Processor { [weak self] (input) -> Processor in
            guard let self = self,
                  let guess = Int(input) else { return Processor(nil) }
            if guess < answer {
                self.output = "Your guess is too low." + .newLine + "Enter your guess: "
                return self.singlePlayerGameProcessor(answer: answer, tries: tries + 1)
            } else if guess > answer {
                self.output = "Your guess is too high." + .newLine + "Enter your guess: "
                return self.singlePlayerGameProcessor(answer: answer, tries: tries + 1)
            } else {
                self.output = "Correct! " + "\(tries)" + " guesses." + .newLine + Self.selectModeMessage
                self.isSinglePlayerMode = false
                return Processor(self.processModeSelection)
            }
        }
    }
}

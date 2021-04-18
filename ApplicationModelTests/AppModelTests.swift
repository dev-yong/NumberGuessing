//
//  AppModelTests.swift
//  ApplicationModelTests
//
//  Created by 이광용 on 2021/04/18.
//

import XCTest
import ApplicationModel

class AppModelTests: XCTestCase {
    
    static let selectModeMessage = "1: Single player game" + String.newLine + "2: Multiplayer game" + .newLine + "3: Exit" + .newLine + "Enter selection: "
    
    /// SUT (System Under Test) : 테스트를 하려는 대상
    func testSUTIsInCompletedWhenItIsInitialized() {
        let sut = AppModel(
            generator: PositivieIntgerGeneratorStub(50)
        )
        let actual = sut.isCompleted
        XCTAssertFalse(actual)
    }
    
    func testSUTCorrectlyPrintsSelectModeMessage() {
        let sut = AppModel(
            generator: PositivieIntgerGeneratorStub(50)
        )
        let actual = sut.flushOutput()
        let expected = Self.selectModeMessage
        XCTAssertEqual(
            actual,
            expected
        )
    }
    
    func testSUTCorrectlyExits() {
        let sut = AppModel(
            generator: PositivieIntgerGeneratorStub(50)
        )
        sut.process(input: "3")
        let actual = sut.isCompleted
        XCTAssertTrue(actual)
    }
    
    func testSUTCorrectlyPrintsSinglePlayerGameStartMessage() {
        let sut = AppModel(
            generator: PositivieIntgerGeneratorStub(50)
        )
        sut.flushOutput()
        sut.process(input: "1")
        
        let actual = sut.flushOutput()
        let expected = "Single player game" + .newLine + "I'm thinking of a number between 1 and 100." + .newLine + "Enter youer guess: "
        XCTAssertEqual(
            actual,
            expected
        )
    }
    
    func testSUTCorrectlyPrintsTooLowMessageInSinglePlayerGame() {
        let testCases = [(50, 40), (30, 29), (89, 9)]
        
        for (answer, guess) in testCases {
            
            let sut = AppModel(
                generator: PositivieIntgerGeneratorStub(answer)
            )
            sut.process(input: "1")
            sut.flushOutput()
            sut.process(input: "\(guess)")
            
            let actual = sut.flushOutput()
            let expected = "Your guess is too low." + .newLine + "Enter your guess: "
            XCTAssertEqual(actual, expected)
        }
    }
    
    func testSUTCorrectlyPrintsTooHighMessageInSiglePlayerGame() {
        let testCases = [(50, 60), (80, 81)]
        
        for (answer, guess) in testCases {
            
            let sut = AppModel(
                generator: PositivieIntgerGeneratorStub(answer)
            )
            sut.process(input: "1")
            sut.flushOutput()
            sut.process(input: "\(guess)")
            
            let actual = sut.flushOutput()
            let expected = "Your guess is too high." + .newLine + "Enter your guess: "
            XCTAssertEqual(actual, expected)
        }
    }
    
    func testSUTCorrectlyPrintsCorrectMessageInSiglePlayerGame() {
        let testCases = [1, 3, 10, 100]
        
        for answer in testCases {
            
            let sut = AppModel(
                generator: PositivieIntgerGeneratorStub(answer)
            )
            sut.process(input: "1")
            sut.flushOutput()
            sut.process(input: "\(answer)")
            
            let actual = sut.flushOutput()
            let expected = "Correct! "
            XCTAssertTrue(actual.starts(with: expected))
        }
    }
    
    func testSUTCorrectlyPrintsGuessCountIfSinglePlayerGameFinished() {
        let testCases = [1, 10, 100]
        
        testCases.forEach { fails in
            let sut = AppModel(
                generator: PositivieIntgerGeneratorStub(50)
            )
            sut.process(input: "1")
            (0..<fails).forEach { _ in
                sut.process(input: "30")
            }
            sut.flushOutput()
            sut.process(input: "50")
            let actual = sut.flushOutput()
            let expected = "\(fails + 1)" + " guesses." + .newLine
            XCTAssertTrue(actual.contains(expected))
        }
    }
    
    func testSUTPrintsSelectModeMssageIfSinglePlayerGameFinished() {
        let sut = AppModel(
            generator: PositivieIntgerGeneratorStub(50)
        )
        sut.process(input: "1")
        sut.flushOutput()
        sut.process(input: "50")
        let actual = sut.flushOutput()
        let expected = Self.selectModeMessage
        XCTAssertTrue(actual.hasSuffix(expected))
    }
}

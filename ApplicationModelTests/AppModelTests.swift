//
//  AppModelTests.swift
//  ApplicationModelTests
//
//  Created by 이광용 on 2021/04/18.
//

import XCTest
import ApplicationModel

class AppModelTests: XCTestCase {
    
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
        XCTAssertEqual(
            actual,
            "1: Single player game" + .newLine + "2: Multiplayer game" + .newLine + "3: Exit" + .newLine + "Enter selection: "
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
        XCTAssertEqual(
            actual,
            "Single player game" + .newLine + "I'm thinking of a number between 1 and 100." + .newLine + "Enter youer guess: "
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
    
}

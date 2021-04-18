//
//  AppModelTests.swift
//  ApplicationModelTests
//
//  Created by 이광용 on 2021/04/18.
//

import XCTest
import ApplicationModel

extension String {
    
    static let newLine: String = "\n"
}

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
    
}

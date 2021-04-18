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
    func testSutIsInCompletedWhenItIsInitialized() {
        let sut = AppModel(
            generator: PositivieIntgerGeneratorStub(50)
        )
        let acture = sut.isCompleted
        XCTAssertFalse(acture)
    }
    
}

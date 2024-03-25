//
//  InfoVMModelTest.swift
//  InfoVMModelTest
//
//  Created by Максим Жуин on 25.03.2024.
//

import XCTest
@testable import Navigation

final class FeedModelTest: XCTestCase {

    var feedVM: FeedViewModel?

    override func setUpWithError() throws {
        feedVM = FeedModel(state: .green)
    }

    override func tearDownWithError() throws {
        feedVM = nil
    }

    func testRightExample() throws {
        let password = "Password"
        feedVM?.check(word: password)
        XCTAssertEqual(feedVM?.state, .green)
    }

    func testWrongExample() throws {
        let password = "123456"
        feedVM?.check(word: password)
        XCTAssertEqual(feedVM?.state, .red)
    }

}

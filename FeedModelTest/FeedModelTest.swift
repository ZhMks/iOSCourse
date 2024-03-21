//
//  FeedModelTest.swift
//  FeedModelTest
//
//  Created by Максим Жуин on 21.03.2024.
//

import XCTest
@testable import Navigation

final class FeedModelTest: XCTestCase {

    var feedModel: FeedModel?

    override func setUpWithError() throws {
        feedModel = FeedModel(state: .green)
    }

    override func tearDownWithError() throws {
        feedModel = nil
    }

    func testGreenState() throws {
        let password = "Password"
        feedModel?.check(word: password)
        XCTAssertEqual(feedModel?.state, .green)
    }

    func testRedState() throws {
        let password = "123456"
        feedModel?.check(word: password)
        XCTAssertEqual(feedModel?.state, .red)
    }

}

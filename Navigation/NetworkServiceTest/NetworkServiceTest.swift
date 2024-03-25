//
//  NetworkServiceTest.swift
//  NetworkServiceTest
//
//  Created by Максим Жуин on 25.03.2024.
//

import XCTest
@testable import Navigation

final class NetworkServiceTest: XCTestCase {

    var networkService: FakeNetworkService?
    var infoVM: InfoViewModel?

    override func setUpWithError() throws {
        networkService = FakeNetworkService()
        infoVM = InfoVMImp(networkService: networkService!, state: .initial)
    }

    override func tearDownWithError() throws {
        networkService = nil
        infoVM = nil
    }

    func testRightExample() throws {
        let url = URL.init(string: "TestString")
        let data = PlanetInformation(orbitPeriod: "String", citizens: [URL.init(string: "Link1")!, URL.init(string: "Link2")!])
        networkService!.results = .success(data)
        networkService?.fetchInformation(with: url!, completion: { result in
            switch result {
            case .success(let success):
                XCTAssertEqual(success, networkService!.results)
            case .failure(let failure):
                ()
            }
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

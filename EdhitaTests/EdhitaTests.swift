//
//  EdhitaTests.swift
//  EdhitaTests
//
//  Created by Tatsuya Tobioka on 2022/07/24.
//

import XCTest

@testable import Edhita

class EdhitaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWriteKeyIgnoresMissingEmptyAndUnexpandedValues() {
        XCTAssertNil(CustomerIOTracker.writeKey(from: nil))
        XCTAssertNil(CustomerIOTracker.writeKey(from: ["CIOCDPWriteKey": ""]))
        XCTAssertNil(CustomerIOTracker.writeKey(from: ["CIOCDPWriteKey": "$(CIO_CDP_WRITE_KEY)"]))
        XCTAssertEqual(CustomerIOTracker.writeKey(from: ["CIOCDPWriteKey": "abc"]), "abc")
    }

    func testUserIDIsFixedInDebugAndPersistedInRelease() {
        let defaults = UserDefaults(suiteName: "CustomerIOTrackerTests")!
        defaults.removePersistentDomain(forName: "CustomerIOTrackerTests")
        XCTAssertEqual(
            CustomerIOTracker.userID(defaults: defaults, isDebug: true), "edhita-demo-user")
        let first = CustomerIOTracker.userID(defaults: defaults, isDebug: false)
        XCTAssertEqual(CustomerIOTracker.userID(defaults: defaults, isDebug: false), first)
        XCTAssertNotEqual(first, "edhita-demo-user")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

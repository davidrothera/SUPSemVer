//
//  SUPSemVerTests.swift
//  SUPSemVerTests
//
//  Created by David Rothera on 26/12/2015.
//  Copyright © 2015 Supratude Ltd. All rights reserved.
//

import XCTest
@testable import SUPSemVer

class SUPSemVerTests: XCTestCase {

    func testStringInit() {
        let test = SemVer("1.2.3")
        XCTAssertNotNil(test, "Created SemVer object should not be nil")
    }

    func testStringInitWithPrerelease() {
        let test = SemVer("1.2.3-rc1")
        XCTAssertNotNil(test)
    }

    func testBasicInit() {
        let test = SemVer(major: 1, minor: 0, patch: 0)
        XCTAssertNotNil(test)
    }

    func testPrereleaseInit() {
        let test = SemVer(major: 1, minor: 0, patch: 0, prerelease: "rc1")
        XCTAssertNotNil(test)
    }

    func testMajorComparison() {
        let test1 = SemVer("1.0.0")!
        let test2 = SemVer("2.0.0")!
        XCTAssertLessThan(test1, test2, "1.0.0 should be less than 2.0.0")
    }

    func testMinorComparison() {
        let test1 = SemVer("1.1.0")!
        let test2 = SemVer("1.2.0")!
        XCTAssertLessThan(test1, test2, "1.1.0 should be less than 1.2.0")
    }

    func testPatchComparison() {
        let test1 = SemVer("1.1.0")!
        let test2 = SemVer("1.1.1")!
        XCTAssertLessThan(test1, test2, "1.1.0 should be less than 1.1.1")
    }

    func testGreaterThanComparison() {
        let test1 = SemVer("1.1.0")!
        let test2 = SemVer("1.1.1")!
        XCTAssertGreaterThan(test2, test1)
    }

    func testGreaterThanComparisonFail() {
        let test1 = SemVer("1.0.0")!
        let test2 = SemVer("1.0.0")!
        XCTAssertGreaterThanOrEqual(test1, test2)
    }

    func testEqual() {
        let test1 = SemVer(major: 1, minor: 0, patch: 0)
        let test2 = SemVer(major: 1, minor: 0, patch: 0)
        XCTAssertEqual(test1, test2)
    }

    func testNotEqual() {
        let test1 = SemVer(major: 1, minor: 0, patch: 0)
        let test2 = SemVer(major: 1, minor: 0, patch: 1)
        XCTAssertNotEqual(test1, test2)
    }

    func testGreaterMinorVersion() {
        let test1 = SemVer(major: 1, minor: 0, patch: 15)
        let test2 = SemVer(major: 1, minor: 1, patch: 0)
        XCTAssertGreaterThan(test2, test1)

        let test3 = SemVer("1.0.15")!
        let test4 = SemVer("1.1")!
        XCTAssertGreaterThan(test4, test3)
    }

    func testMissingComponents() {
        let test1 = SemVer(major: 1, minor: 0, patch: 0)
        let test2 = SemVer("1")
        XCTAssertEqual(test1, test2)

        let test3 = SemVer(major: 1, minor: 1, patch: 0)
        let test4 = SemVer("1.1")
        XCTAssertEqual(test3, test4)
    }

    func testBlankVersion() {
        let test1 = SemVer("hi.ho.silver")
        let test2 = SemVer(major: 0, minor: 0, patch: 0)
        XCTAssertEqual(test1, test2)
    }

}

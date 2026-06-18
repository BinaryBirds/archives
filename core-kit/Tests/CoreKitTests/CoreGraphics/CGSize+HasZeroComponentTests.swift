//
//  CGSize+HasZeroComponentTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGSize_HasZeroComponentTests: XCTestCase {

    func testZero() throws {
        XCTAssertTrue(CGSize.zero.hasZeroComponent)
        XCTAssertTrue(CGSize(width: 4, height: 0).hasZeroComponent)
        XCTAssertTrue(CGSize(width: 0, height: 2).hasZeroComponent)
        XCTAssertTrue(CGSize(width: -6, height: 0).hasZeroComponent)
        XCTAssertTrue(CGSize(width: 0, height: -9).hasZeroComponent)
        
        XCTAssertFalse(CGSize(width: 1, height: 1).hasZeroComponent)
        XCTAssertFalse(CGSize(width: -1, height: -1).hasZeroComponent)
    }
    
}

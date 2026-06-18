//
//  CGPoint+HasZeroComponentTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_HasZeroComponentTests: XCTestCase {

    func testZero() throws {
        XCTAssertTrue(CGSize.zero.hasZeroComponent)
        XCTAssertTrue(CGPoint(x: 4, y: 0).hasZeroComponent)
        XCTAssertTrue(CGPoint(x: 0, y: 2).hasZeroComponent)
        XCTAssertTrue(CGPoint(x: -6, y: 0).hasZeroComponent)
        XCTAssertTrue(CGPoint(x: 0, y: -9).hasZeroComponent)
        
        XCTAssertFalse(CGPoint(x: 1, y: 1).hasZeroComponent)
        XCTAssertFalse(CGPoint(x: -1, y: -1).hasZeroComponent)
    }
    
}

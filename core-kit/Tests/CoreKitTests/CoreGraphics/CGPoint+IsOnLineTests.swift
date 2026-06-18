//
//  CGPoint_IsOnLineTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_IsOnLineTests: XCTestCase {
    
    func testXStraightLinePoint() throws {
        let p = CGPoint(x: 4, y: 8)
        let l1 = CGPoint(x: 4, y: 2)
        let l2 = CGPoint(x: 4, y: 3)
        
        let r = p.isOnLine(l1, l2)
        XCTAssertTrue(r)
    }
    
    func testYStraightLinePoint() throws {
        let p = CGPoint(x: 6, y: 2)
        let l1 = CGPoint(x: 4, y: 2)
        let l2 = CGPoint(x: 5, y: 2)
        
        let r = p.isOnLine(l1, l2)
        XCTAssertTrue(r)
    }
    
    func testXStraightLinePointFalse() throws {
        let p = CGPoint(x: 5, y: 8)
        let l1 = CGPoint(x: 4, y: 2)
        let l2 = CGPoint(x: 4, y: 3)
        
        let r = p.isOnLine(l1, l2)
        XCTAssertFalse(r)
    }

    func testYStraightLinePointFalse() throws {
        let p = CGPoint(x: 6, y: 3)
        let l1 = CGPoint(x: 4, y: 2)
        let l2 = CGPoint(x: 5, y: 2)
        
        let r = p.isOnLine(l1, l2)
        XCTAssertFalse(r)
    }
    
    func testZeroLinePointFalse() throws {
        let p = CGPoint.zero
        let l1 = CGPoint.zero
        let l2 = CGPoint(x: 1, y: 0)
        
        let r = p.isOnLine(l1, l2)
        XCTAssertTrue(r)
    }
}

//
//  CGPoint+ControlPointTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGPoint_ControlPointTests: XCTestCase {

    func testX() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 8, y: 9)
        
        let m = p1.xControlPoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: 8, y: 5.5))
    }
    
    func testY() throws {
        let p1 = CGPoint(x: 4, y: 2)
        let p2 = CGPoint(x: 8, y: 9)
        
        let m = p1.yControlPoint(to: p2)
        XCTAssertEqual(m, CGPoint(x: 6, y: 9))
    }
    
    
}

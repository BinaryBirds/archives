//
//  CGRect+ScaleToTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGRect_ScaleToTests: XCTestCase {

    func testScale() throws {
        let r1 = CGRect(x: 5, y: 5, width: 20, height: 10)
        let r2 = CGRect(x: 2, y: 2, width: 4, height: 3)

        let r3 = r1.scaleToFit(in: r2)
        let e1 = CGRect(x: 2, y: 2.5, width: 4, height: 2)
        XCTAssertEqual(r3, e1)
        
        let r4 = r1.scaleToFill(r2)
        let e2 = CGRect(x: 1, y: 2, width: 6, height: 3)
        XCTAssertEqual(r4, e2)
    }
    
}



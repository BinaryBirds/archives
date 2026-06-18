//
//  CGSize+ScaleToTests.swift
//  CoreKitTests
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

import XCTest
@testable import CoreKit

final class CGSize_ScaleToTests: XCTestCase {

    func testScale() throws {
        let s1 = CGSize(width: 20, height: 10)
        let s2 = CGSize(width: 15, height: 5)

        XCTAssertEqual(s1.scaleToFit(in: s2), 0.5)
        XCTAssertEqual(s1.scaleToFill(s2), 0.75)
    }
    
}



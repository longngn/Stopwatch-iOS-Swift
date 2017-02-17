//
//  StopWatchTests.swift
//  StopWatchTests
//
//  Created by Nguyen Le Vu Long on 12/23/16.
//  Copyright © 2016 Nguyen Le Vu Long. All rights reserved.
//

import XCTest
import os.log
@testable import StopWatch

class StopWatchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let a = Timer()
        //os_log("fucking son of a bitch", log: .default, type: .debug)
        print(a.toString)
    }
}

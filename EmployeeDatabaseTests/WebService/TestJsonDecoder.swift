//
//  TestJsonDecoder.swift
//  EmployeeDatabaseTests
//
//  Created by Uday on 04/08/22.
//

import XCTest
@testable import EmployeeDatabase


class TestJsonDecoder: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testGetTypeWhenParsinIsSuccessFull() {
        
         let fileURL = Bundle(for: MockServiceHandlerManager.self).url(forResource: "Employee", withExtension: "json")!
        
        let data =  try! Data(contentsOf: fileURL)
        
        let employees:[Employee] =  try! JSONDecoder().getType(from: data)
        
        XCTAssertNotNil(employees)
        
        XCTAssertEqual(employees.count, 71)
    }
    
    // When parsing fails due to invalid input
    func testGetTypeWhenParsinIsFailed() {
        
         let fileURL = Bundle(for: MockServiceHandlerManager.self).url(forResource: "EmployeeInValidResponse", withExtension: "json")!
        
        let data =  try! Data(contentsOf: fileURL)
        
        let employees:[Employee]? =  try? JSONDecoder().getType(from: data)
        
        XCTAssertNil(employees)
        
    }

}

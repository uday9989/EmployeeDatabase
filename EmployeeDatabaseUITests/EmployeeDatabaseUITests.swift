//
//  EmployeeDatabaseUITests.swift
//  EmployeeDatabaseUITests
//
//  Created by Uday on 04/08/22.
//

import XCTest

class EmployeeViewControllerUITests: XCTestCase {

    var app:XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app  =  XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
         app = nil
    }

    
    func testTitle() {
    
      let titleBar =  app.navigationBars["Employees"].staticTexts["Employees"]
        
        XCTAssertEqual(titleBar.label, "Employees")
    }
    
    func testUITableExists() {
        let table = app.tables
        XCTAssertNotNil(table.firstMatch)
    }
    
}

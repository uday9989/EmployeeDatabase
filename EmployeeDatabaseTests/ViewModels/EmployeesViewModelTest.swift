//
//  EmployeesViewModelTest.swift
//  EmployeeDatabase 
//
//  Created by uday on 03/08/2022.
//  

import XCTest
@testable import EmployeeDatabase

class EmployeesViewModelTest: XCTestCase {
    
    var sut: EmployeesViewModel!
    var mockRequestManager: MockServiceHandlerManager!
    let viewController = EmployeeViewController()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRequestManager = MockServiceHandlerManager()
        viewController.viewDidLoad()
        sut = EmployeesViewModel(apiService:mockRequestManager, view: viewController)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRequestManager = nil
        try super.tearDownWithError()
    }
    
    // Emloyee Api call successfull
    func testFetchEmployeesSuccess() {
        sut.fetchEmployees()
        
        XCTAssertEqual(sut.employees.count, 71)

        XCTAssertEqual(sut.employees.first?.firstName, "Maggie")

    }
    
    // Emloyee Api call Failes
    func testFetchEmployeesFailure() {
        mockRequestManager.responseType = .error
        sut.fetchEmployees()
        
        XCTAssertEqual(sut.employees.count, 0)
    }
    
    // API successfull but parsing failed
    func testFetchEmployeesWhenApiIsSuccessFullButParsingFails() {
        mockRequestManager.responseType = .success("EmployeeInValidResponse")
        sut.fetchEmployees()
        
        XCTAssertEqual(sut.employees.count, 0)
    }
}

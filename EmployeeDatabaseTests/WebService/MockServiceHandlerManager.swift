//
//  APIServiceTest.swift
//  EmployeeDatabase 
//
//  Created by uday on 03/08/2022.
//  

import Foundation
@testable import EmployeeDatabase

enum ResponseType {
    case error
    case success(String)
}

class MockServiceHandlerManager: APIServiceManager {
    var responseType = ResponseType.success("Employee")
    
    func call(url: URL, complete: @escaping Completion) {
        switch responseType {
        case .error:
            complete(.failure(.noData))
        case .success(let fileName):
            let jsonData = dataFromJSON(withName: fileName)!
            complete(.success(jsonData))
        }
    }
    
   private func dataFromJSON(withName name: String) -> Data? {
        guard let fileURL = Bundle(for: MockServiceHandlerManager.self).url(forResource: name, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: fileURL)
    }
}
 

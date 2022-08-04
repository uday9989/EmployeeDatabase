//
//  APIError.swift
//  EmployeeDatabase
//
//  Created by Uday on 04/08/22.
//

import Foundation

enum APIError: Error {
    case error(Error)
    case noData
    case invalidResponseCode(Int)
}

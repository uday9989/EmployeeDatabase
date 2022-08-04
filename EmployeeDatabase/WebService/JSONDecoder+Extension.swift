//
//  JSONDecoder+Extension.swift
//  EmployeeDatabase
//
//  Created by Uday on 04/08/22.
//

import Foundation

extension JSONDecoder {
    func getType<T : Decodable>(from jsonData: Data) throws -> [T] {
        return try JSONDecoder().decode([T].self, from: jsonData)
    }
}

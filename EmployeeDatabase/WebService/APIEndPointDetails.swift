//
//  APIEndPointDetails.swift
//  EmployeeDatabase
//
//  Created by Uday on 04/08/22.
//

import Foundation

enum API : String {
    static let BaseURL =  "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    case employee = "people"
    
    var url : URL {
        get{
            return URL(string: API.BaseURL + self.rawValue)!
        }
    }
}

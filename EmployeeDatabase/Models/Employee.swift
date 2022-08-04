//
//  Employee.swift
//  EmployeeDatabase 
//
//  Created by uday on 30/07/22

import Foundation

struct Employee: Decodable {
    var createdAt: String?
    var firstName: String
    var avatar: String?
    var lastName: String
    var email: String?
    var jobTitle: String
    var favouriteColor: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey{
        case createdAt,firstName,avatar,email,lastName,favouriteColor,id
        case jobTitle = "jobtitle"
    }
}


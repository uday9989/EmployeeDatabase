//
//  APIService.swift
//  EmployeeDatabase 
//
//  Created by uday on 30/07/22
//  

import Foundation

typealias Completion = (Result<Data, APIError>) -> Void

protocol APIServiceManager {
    func call(url: URL, complete:@escaping Completion)
}

final class APIService: APIServiceManager {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func call(url: URL, complete: @escaping Completion) {
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            
            if let error = error {
                complete(.failure(.error(error)))
            }
            
            guard let data = data else {
                complete(.failure(.noData))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200...299:
                    complete(.success(data))
                default:
                    complete(.failure(.invalidResponseCode(response.statusCode)))
                }
            }
        }
        
        task.resume()
    }
}

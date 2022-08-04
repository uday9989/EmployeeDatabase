//
//  EmployeesViewModel.swift
//  EmployeeDatabase 
//
//  Created by  uday on 30/07/22
//

import Foundation


protocol EmployeeViewModelContract {
    var employees: [Employee] {get}
    func fetchEmployees()
}

final class EmployeesViewModel {
    private let apiService : APIServiceManager
    private weak var view:EmployeeViewContract?
    var employees: [Employee] = []

    init(apiService : APIServiceManager, view: EmployeeViewContract) {
        self.apiService =  apiService
        self.view = view
    }
}


extension EmployeesViewModel: EmployeeViewModelContract {
    
    func fetchEmployees() {
        self.apiService.call(url: API.employee.url) { [weak self] result in
            switch (result) {
            case .success(let data):
                do  {
                    self?.employees = try JSONDecoder().getType(from: data)
                    DispatchQueue.main.async {
                        self?.view?.refreshUI()
                    }
                } catch {
                    self?.employees = []
                    DispatchQueue.main.async {
                        self?.view?.showError()
                    }
                }
            case .failure(_):
                self?.employees = []
                DispatchQueue.main.async {
                    self?.view?.showError()
                }
            }
        }
    }
}

//
//  EmployeeViewController.swift
//  EmployeeDatabase 
//
//  Created by uday on 30/07/22.
//

import UIKit

protocol EmployeeViewContract: AnyObject {
    func refreshUI()
    func showError()
}

final class EmployeeViewController: UIViewController, Alertable {
    
    @IBOutlet private  weak var employeeTableView: UITableView!
    
    private var employeeViewModel :EmployeeViewModelContract!
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,Employee>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("employees", comment:"")
        
        employeeViewModel = EmployeesViewModel(apiService:APIService(), view: self)
        
        employeeViewModel.fetchEmployees()
    }

    private func updateDataSource() {
        
       dataSource =  EmployeeTableViewDataSource(cellIdentifier:"EmployeeTableViewCell", items: employeeViewModel.employees) { cell , employee  in
           cell.updateUI(employee: employee)
        }
    }
    
}

extension EmployeeViewController: EmployeeViewContract {
    func refreshUI() {
            self.updateDataSource()
            employeeTableView?.dataSource = self.dataSource
            employeeTableView?.reloadData()
    
    }
    
    func showError() {
        self.showAlert(message:NSLocalizedString("api_failed_message", comment: ""))
    }
}

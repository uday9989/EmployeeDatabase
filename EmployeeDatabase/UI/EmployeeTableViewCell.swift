//
//  EmployeeTableViewCell.swift
//EmployeeDatabase
//  Created by uday on 30/07/22
//n

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var employeeIdLabel: UILabel!
    @IBOutlet private weak var employeeNameLabel: UILabel!

    func updateUI(employee: Employee) {
        employeeIdLabel.text = "\(employee.firstName) \(employee.lastName)"
        employeeNameLabel.text = employee.jobTitle
        configureAccessibility(employee: employee)
    }
    
    private func configureAccessibility(employee: Employee) {
        self.accessibilityLabel = NSLocalizedString("employee_details_label", comment:"")
        
        var value = NSLocalizedString("employee_details_value", comment:"")
        
         value = value.replacingOccurrences(of:"{name}", with:"\(employee.firstName) \(employee.lastName)")
        
        value = value.replacingOccurrences(of:"{job_title}", with:"\(employee.jobTitle)")
        
        self.accessibilityValue = value
    }
}


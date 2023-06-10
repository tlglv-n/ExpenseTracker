//
//  MainViewController.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 02.06.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func initialState() {
        tableView?.dataSource = self
    }
    
    @IBAction func addExpenseButtonPressed(_ sender: Any) {
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
    }
    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ExpenseCell.self, for: indexPath)
        let expense = expenses[indexPath.row]
        
        cell.titleLabel?.text = expense.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        if let date = expense.date {
            cell.dateLabel?.text = dateFormatter.string(from: date)
        } else {
            cell.dateLabel?.text = ""
        }
        
        let expenseString = String(expense.expenseSum)
        cell.expenseLabel?.text = expenseString
        
        
        return cell
    }
}


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
    
    let viewModel = MainViewModel()
    let authViewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        incomeLabel.text = String(viewModel.totalIncomeSum)
        outcomeLabel.text = String(viewModel.totalOutcomeSum)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchViewModel()
    }
    
    private func initialState() {
        tableView?.register(ExpenseCell.self)
        tableView?.dataSource = self
        tableView?.delegate = self
        fetchViewModel()
    }
    
    private func fetchViewModel() {
        viewModel.fetchData {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addExpenseButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Add expense", message: nil, preferredStyle: .alert)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        alertController.view.addSubview(datePicker)
        
        alertController.addTextField() {(textField) in
            textField.placeholder = "Title"
        }
        alertController.addTextField() { (textField) in
            textField.placeholder = "Amount"
            textField.keyboardType = .decimalPad
        }
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in

            let titleTextField = alertController.textFields?[0]
            let expenseSumTextField = alertController.textFields?[1]
            let date = datePicker.date
            
            if let title = titleTextField?.text, let expenseSumText = expenseSumTextField?.text,
                let expenseSum = Double(expenseSumText) {
                self.viewModel.addData(title: title, date: date, expenseSum: expenseSum) {
                    self.tableView?.reloadData()
                }
            } else {
                print("Error alert")
            }
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        authViewModel.logout()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginScreenViewController") as! LoginScreenViewController
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = loginViewController
        }
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.expenses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ExpenseCell.self, for: indexPath)
        let expense = viewModel.expenses?[indexPath.row]
        
        cell.titleLabel?.text = expense?.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        if let date = expense?.date {
            cell.dateLabel?.text = dateFormatter.string(from: date)
        } else {
            cell.dateLabel?.text = ""
        }
        
        let expenseString = String(expense?.expenseSum ?? 0)
        cell.expenseLabel?.text = expenseString
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.viewModel.removeData(atIndexPath: indexPath) {
                self.tableView.reloadData()
            }
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}


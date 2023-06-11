//
//  MainViewModel.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 10.06.2023.
//

import Foundation
import UIKit
import CoreData

class MainViewModel: CoreDataCRUDProtocol {
    var expenses: [Expense]?
    
    var totalIncomeSum: Double {
        let incomeExpenses = expenses?.filter { $0.expenseSum ?? 0 >= 0 }
        return incomeExpenses?.reduce(0, { $0 + ($1.expenseSum ?? 0) }) ?? 0
    }
    
    var totalOutcomeSum: Double {
        let outcomeExpenses = expenses?.filter { $0.expenseSum ?? 0 < 0 }
        return outcomeExpenses?.reduce(0, { $0 + ($1.expenseSum ?? 0) }) ?? 0
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData(tableViewHandler handler: @escaping () -> ()) {
        do {
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            self.expenses = try context.fetch(request)
            
            DispatchQueue.main.async {
                handler()
            }
        } catch {
            
        }
    }
    
    func addData(title: String, date: Date, expenseSum: Double, tableViewHandler handler: @escaping () -> ()) {
        let expense = Expense(context: context)
        expense.title = title
        expense.date = date
        expense.expenseSum = expenseSum
        
        saveData(tableViewHandler: handler)
    }
    
    func removeData(atIndexPath indexPath: IndexPath, tableViewHandler handler: @escaping () -> ()) {
        let expenseToRemove = expenses![indexPath.row]
        self.context.delete(expenseToRemove)
        
        saveData(tableViewHandler: handler)
    }
    
    func updateData(atIndexPath indexPath: IndexPath, title: String, date: Date, expenseSum: Double, tableViewHandler handler: @escaping () -> ()) {
        let expense = self.expenses![indexPath.row]
        
        expense.title = title
        expense.date = date
        expense.expenseSum = expenseSum
        
        saveData(tableViewHandler: handler)
    }
    
    func saveData(tableViewHandler handler: @escaping () -> ()) {
        do {
            try context.save()
        } catch {
            
        }
        fetchData() {
            handler()
        }
    }
}

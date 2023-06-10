//
//  Expense+CoreDataProperties.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 10.06.2023.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var title: String?
    @NSManaged public var expenseSum: Double
    @NSManaged public var date: Date?

}

extension Expense : Identifiable {

}

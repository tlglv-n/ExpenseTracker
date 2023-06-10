//
//  UIKit + Extension.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 10.06.2023.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        let name = String(describing: cellType)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T else {
            fatalError("\(T.self) is expected to have reusable identifier: \(String(describing: cellType))")
        }
        return cell
    }
}

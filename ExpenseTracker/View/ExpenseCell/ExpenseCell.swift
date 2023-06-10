//
//  ExpenseCell.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 10.06.2023.
//

import UIKit

class ExpenseCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var expenseLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}

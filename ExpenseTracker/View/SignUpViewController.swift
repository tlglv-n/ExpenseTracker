//
//  SignUpViewController.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 02.06.2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        bindViewModel()
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.loginViewModel.userSignUpPressed(login: (self.emailTextField.text ?? ""), password: self.passwordTextField.text ?? "")
        }
    }
    
    private func initialState() {
        statusLabel?.text = "Please enter your login credentials"
        statusLabel?.textColor = UIColor.lightGray
    }
    
    private func bindViewModel() {
        loginViewModel.statusText.bind { (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        }
        
        loginViewModel.statusColor.bind { (statusColor) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        }
    }
    
}

//
//  SignInViewController.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 02.06.2023.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    var authViewModel = AuthViewModel()
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        bindViewModel()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.loginViewModel.userLoginPressed(login: (self.emailTextField.text ?? ""), password: (self.passwordTextField.text ?? ""))
            
            if self.loginViewModel.signInProccess() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = mainViewController
                }
            }
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

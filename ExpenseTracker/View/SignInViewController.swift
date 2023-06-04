//
//  SignInViewController.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 02.06.2023.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailTextField(_ sender: Any) {
    }
    
    @IBAction func passwordTextField(_ sender: Any) {
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignInScreen", sender: self)
    }
    
}

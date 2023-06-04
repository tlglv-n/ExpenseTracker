//
//  LoginScreen.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 02.06.2023.
//

import UIKit

class LoginScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignInScreen", sender: self)
    }
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignUpScreen", sender: self)
    }
    
}

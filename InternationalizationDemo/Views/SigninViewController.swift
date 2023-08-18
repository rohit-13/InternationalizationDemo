//
//  SigninViewController.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 21/07/23.
//

import UIKit

class SigninViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func signinBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty {
            if KeychainHelper.shared.checkPassword(email: email, password: password) {
                guard let welcomeVC = storyboard?.instantiateViewController(identifier: "welcomeVC") as? WelcomeViewController else { return }
                welcomeVC.user = email
                navigationController?.pushViewController(welcomeVC, animated: true)
            }
            else {
                self.showErrorAlert(LocalizationHelper.invalidCredentials)
            }
        }
    }
}

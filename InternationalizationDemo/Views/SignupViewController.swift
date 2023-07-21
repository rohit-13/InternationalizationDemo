//
//  SignupViewController.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 21/07/23.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func backToLoginBtnPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else { return }
            if KeychainHelper.shared.checkKeyChain(email: email) {
                self.showErrorAlert("Account already exists.")
            }
            else {
                KeychainHelper.shared.savePassword(email: email, password: password)
                self.showInfoAlert("Account created successfully.")
            }
        }
    }
    
}

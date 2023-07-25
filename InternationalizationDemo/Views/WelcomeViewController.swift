//
//  WelcomeViewController.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 21/07/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatString = NSLocalizedString("Welcome %@", comment: "welcome user")
        welcomeLabel.text = String.localizedStringWithFormat(formatString, user!)
    }
}

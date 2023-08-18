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
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(self.settingsButtonPressed))
        self.navigationItem.rightBarButtonItem = settingsButton
        welcomeLabel.text = LocalizationHelper.welcomeUser([user!])
    }
    
    @objc func settingsButtonPressed() {
        guard let languageVC = storyboard?.instantiateViewController(identifier: "SelectLanguageViewController") as? SelectLanguageViewController else { return }
        languageVC.navigationItem.title = LocalizationHelper.selectLanguage
        navigationController?.pushViewController(languageVC, animated: true)
    }
}

//
//  Extensions.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 21/07/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(_ error: String) {
        let alert = UIAlertController(title: LocalizationHelper.error, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LocalizationHelper.ok, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showInfoAlert(_ message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension UserDefaults {
    var selectedLanguage: String? {
        get { string(forKey: "i18n_language") }
        set { set(newValue, forKey: "i18n_language") }
    }
}

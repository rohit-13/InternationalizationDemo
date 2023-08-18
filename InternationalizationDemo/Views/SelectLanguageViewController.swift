//
//  SelectLanguageViewController.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 17/08/23.
//

import UIKit

class SelectLanguageViewController: UITableViewController {
    private let viewModel = SelectLanguageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let doneButton = UIBarButtonItem(title: LocalizationHelper.done, style: .plain, target: self, action: #selector(self.doneButtonPressed))
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneButtonPressed() {
        if UserDefaults.standard.selectedLanguage != viewModel.selectedLanguage.code {
            UserDefaults.standard.selectedLanguage = viewModel.selectedLanguage.code
            SceneDelegate.shared?.reloadWindow()
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.availableLanguage.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectLanguageTableViewCell
        cell.languageNameLabel.text = viewModel.availableLanguage[indexPath.row].name
        cell.accessoryType = viewModel.selectedLanguageIndex == indexPath.row ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedLanguageIndex = indexPath.row
        tableView.reloadData()
    }
}

struct Language {
    var code: String
    var name: String?
}

class SelectLanguageViewModel {
    var availableLanguage = [Language]()
    var selectedLanguageIndex: Int
    var selectedLanguage: Language {
        availableLanguage[selectedLanguageIndex]
    }

    init() {
        availableLanguage = Bundle.main.localizations
            .filter { $0 != "Base" }
            .map { Language(code: $0, name: Locale.current.localizedString(forLanguageCode: $0)) }
        
        selectedLanguageIndex = availableLanguage
            .map { $0.code }
            .firstIndex(of: UserDefaults.standard.selectedLanguage ?? "en") ?? 0
    }
}

class SelectLanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var languageNameLabel: UILabel!
}

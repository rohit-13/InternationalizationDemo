//
//  LocalizationHelper.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 09/08/23.
//

import Foundation

class LocalizationHelper {
    public static func localize(_ key: String) -> String {
        if UserDefaults.standard.selectedLanguage == nil {
            UserDefaults.standard.selectedLanguage = "en"
            UserDefaults.standard.synchronize()
        }
        
        let lang = UserDefaults.standard.selectedLanguage
        guard let path = Bundle.main.path(forResource: lang, ofType: "lproj") else {
            return NSLocalizedString(key, comment: "")
        }
        
        let bundle = Bundle(path: path)
        return NSLocalizedString(key, bundle: bundle!, comment: "")
    }

    private static func localize(args: [CVarArg], key: String) -> String {
        String(format: localize(key), args)
    }

    static var signInToAccount: String { localize("sign-in-to-account") }
    static var enterEmail: String { localize("enter-email") }
    static var email: String { localize("email") }
    static var enterPassword: String { localize("enter-password") }
    static var password: String { localize("password") }
    static var singIn: String { localize("sing-in") }
    static var signUpHere: String { localize("sign-up-here") }
    
    static var back: String { localize("back") }
    static var backToLogin: String { localize("back-to-login") }
    static var createNewAccount: String { localize("create-new-account") }
    static var confirmPassword: String { localize("confirm-password") }
    static var signUp: String { localize("sign-up") }
    static var accountAlreadyExists: String { localize("account-already-exists") }
    static var accountCreatedSuccessfully: String { localize("account-created-successfully") }
    static var invalidCredentials: String { localize("invalid-credentials") }
    
    static var selectLanguage: String { localize("select-language") }
    static var done: String { localize("done") }
    static var error: String { localize("error") }
    static var ok: String { localize("ok") }
    static var close: String { localize("close") }
    static func welcomeUser(_ args: [CVarArg]) -> String {
        localize(args: args, key: "welcome-user")
    }
}

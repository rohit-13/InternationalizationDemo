//
//  LocalizableExtensions.swift
//  InternationalizationDemo
//
//  Created by Rohit Kumar on 08/08/23.
//

import Foundation
import UIKit

protocol StbIBLocalizable {
    var localizedKey: String? { get set }
}

extension UILabel: StbIBLocalizable {
    @IBInspectable var localizedKey: String? {
        get { nil }
        set(key) {
            if let key = key { text = LocalizationHelper.localize(key) }
        }
    }
}

extension UIButton: StbIBLocalizable {
    @IBInspectable var localizedKey: String? {
        get { nil }
        set(key) {
            if let key = key {
                setTitle(LocalizationHelper.localize(key), for: .normal)
                setTitle(LocalizationHelper.localize(key), for: .highlighted)
                setTitle(LocalizationHelper.localize(key), for: .selected)
                setTitle(LocalizationHelper.localize(key), for: .disabled)
            }

        }
    }
}

extension UINavigationItem: StbIBLocalizable {
    @IBInspectable var localizedKey: String? {
        get { nil }
        set(key) {
            if let key = key { title = LocalizationHelper.localize(key) }
        }
    }
}

extension UIBarItem: StbIBLocalizable {
    @IBInspectable var localizedKey: String? {
        get { nil }
        set(key) {
            if let key = key { title = LocalizationHelper.localize(key) }
        }
    }
}

extension UITextField: StbIBLocalizable {
    @IBInspectable var localizedKey: String? {
        get { nil }
        set(key) {
            if let key = key {
                placeholder = LocalizationHelper.localize(key)
            }
        }
    }
}

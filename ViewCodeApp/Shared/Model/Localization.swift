//
//  Localization.swift
//  ViewCodeApp
//
//  Created by Usuário Convidado on 13/10/20.
//  Copyright © 2020 Usuário Convidado. All rights reserved.
//

import Foundation

enum Localization {
    static let welcome = "WELCOME".localized
    static let main = "MAIN".localized
    static let loginButton = "LOGIN_BUTTON".localized
    static let signUpButton = "SIGNUP_BUTTON".localized
    static let phone = "PHONE".localized
    static let socialMedia = "SOCIAL_MEDIA".localized
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

//
//  WelcomeView.swift
//  ViewCodeApp
//
//  Created by Usuário Convidado on 13/10/20.
//  Copyright © 2020 Usuário Convidado. All rights reserved.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonTapped(withPhone: String)
    func signUpButtonTapped()
    func facebookButtonTapped()
    func googleButtonTapped()
}

class WelcomeView: UIView, CodeView {
    
    //MARK: Properties
    weak var delegate: WelcomeViewDelegate?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = #imageLiteral(resourceName: "home")
        //ou imageView.image = UIImage(named: "home")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.welcome
        label.textAlignment = .center
        label.font = .title
        label.textColor = .title
        label.accessibilityIdentifier = "welcome-title-label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.main
        label.textAlignment = .center
        label.font = .body
        label.textColor = .body
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = Localization.phone
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.keyboardType = .phonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = Margin.horizontalSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let loginButton = WelcomeButton(style: .main, title: Localization.loginButton)
    let singUpButton = WelcomeButton(style: .secondary, title: Localization.signUpButton)
    
    let footerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.socialMedia
        label.textAlignment = .center
        label.font = .body
        label.textColor = .body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let socialMediaStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = Margin.horizontalSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: Super Methods
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Methods
    init(delegate: WelcomeViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
        
    func setupComponents() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(singUpButton)
    }
    
    func setupConstraints() {
        //NSLayoutContraints
        
        //VLF (Visual Format Language)
        
        //Layout Anchors
        
        //ScrollView
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //ContentView
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        contentViewHeightConstraint.isActive = true
        
        //MainImage
        mainImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Margin.verticalVeryLarge).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin.horizontal).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin.horizontal).isActive = true
        mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        //TitleLabel
        titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: Margin.verticalVeryLarge).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        //BodyLabel
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Margin.verticalSmall).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        //PhoneTextField
        phoneTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: Margin.verticalLarge).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        //ButtonStackView
        buttonsStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: Margin.verticalNormal).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        //Login/SingUp buttons
        loginButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        singUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .view
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        singUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(sender: UIButton) {
        switch sender {
        case loginButton:
            delegate?.loginButtonTapped(withPhone: phoneTextField.text!)
        case singUpButton:
            delegate?.signUpButtonTapped()
        default:
            break
        }
    }
}

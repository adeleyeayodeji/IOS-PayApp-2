//
//  ViewController.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 09/08/2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUIComponents()
        containerMode()
    }
    
    private func containerMode(){
        // Create the container (UIStackView)
       let stackView = UIStackView()
       stackView.axis = .vertical // Use .horizontal for rows
        
        // Create the container stack view
        let appBar = UIStackView()
        appBar.axis = .horizontal
        appBar.alignment = .top
        appBar.distribution = .equalSpacing
        
        // Create the question mark icon image
        let questionMarkImage = UIImage(systemName: "questionmark.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        // Create the question mark icon buttons
        let backButton = UIButton(type: .system)
        backButton.setImage(questionMarkImage, for: .normal)
    
        let addButton = UIButton(type: .system)
       //Load the image from URL using Kingfisher
         if let imageURL = URL(string: "https://picsum.photos/50/50") {
             addButton.kf.setImage(with: imageURL, for: .normal)
             addButton.tintColor = .black  // Set button image color
             appBar.addArrangedSubview(addButton)
         } else {
             addButton.setTitle("Add", for: .normal)
         }
        
        
        // Add the items to the stack view
        appBar.addArrangedSubview(backButton)
        appBar.addArrangedSubview(addButton)
       
        stackView.addArrangedSubview(appBar)
       
       // Add the container stack view to the main view
       view.addSubview(stackView)
       
       // Add constraints to position and size the stack view
       stackView.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
           stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
           stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
       ])
    }

    //ui component
    private func setupUIComponents() {
        view.backgroundColor = .white
        // adding constraints to profileImageView
       view.addSubview(profileImageView)
       profileImageView.translatesAutoresizingMaskIntoConstraints = false
       profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
       profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
       profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        // adding constraints to email text field
       view.addSubview(emailTextField)
       emailTextField.translatesAutoresizingMaskIntoConstraints = false
       emailTextField.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 30).isActive = true
       emailTextField.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -30).isActive = true
       emailTextField.heightAnchor.constraint(equalToConstant:50).isActive = true
       emailTextField.topAnchor.constraint(equalTo:profileImageView.bottomAnchor, constant: 60).isActive = true
        
        
        // adding constraints to passwordTextField
       view.addSubview(passwordTextField)
       passwordTextField.translatesAutoresizingMaskIntoConstraints =   false
       passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
       passwordTextField.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -30).isActive = true
       passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
       passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        
        // adding constraints to register button
       view.addSubview(registerButton)
       registerButton.translatesAutoresizingMaskIntoConstraints = false
       registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
       registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
       registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
       registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
     }
    
    private let registerButton: UIButton = {
       let button = UIButton(type: .system)
       button.backgroundColor = .darkGray
       button.setTitle("Register", for: .normal)
       button.setTitleColor(.white, for: .normal)
       button.layer.cornerRadius = 8
       button.layer.masksToBounds = true
       return button
    }()
    
    private let passwordTextField: UITextField = {
       let textField = UITextField()
       textField.layer.cornerRadius = 8
       textField.layer.masksToBounds = true
       textField.isSecureTextEntry = true
       textField.layer.borderWidth = 1.0
       textField.layer.borderColor = UIColor(white: 0, alpha:
       0.3).cgColor
       textField.placeholder = "Password"
       textField.textAlignment = .center
       return textField
    }()
    
    private let emailTextField: UITextField = {
       let textField = UITextField()
       textField.keyboardType = .emailAddress
       textField.layer.cornerRadius = 8
       textField.layer.masksToBounds = true
       textField.layer.borderWidth = 1.0
       textField.layer.borderColor = UIColor(white: 0, alpha:0.3).cgColor
       textField.placeholder = "Email Address"
       textField.textAlignment = .center
       return textField
    }()
    
    // profile image view customization
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFill
       imageView.layer.cornerRadius = 16
       imageView.layer.masksToBounds = true
       imageView.backgroundColor = UIColor(white: 0, alpha: 0.1)
       return imageView
    }()
}


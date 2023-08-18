//
//  UserProfile.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 12/08/2023.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        // Disable dark mode
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        }
        //bg color
        view.backgroundColor = .white
        //load the view
        loadUserView()
    }
    
    @objc private func editAccountButton(){
        print("Edit User Modal")
    }
    
    @objc private func closePageButton(){
        dismiss(animated: true, completion: nil)
    }
    
    private func loadUserView(){
        // Create the container (UIStackView)
       let stackView = UIStackView()
       stackView.axis = .vertical // Use .horizontal for rows
        
        // Create the container stack view
        let appBar = UIStackView()
        appBar.axis = .horizontal
        appBar.alignment = .top
        appBar.distribution = .equalSpacing
        
        // Create the question mark icon image
        let closeIcon = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        // Create the question mark icon buttons
        let closeButton = UIImageView(image: closeIcon)
        closeButton.contentMode = .scaleAspectFit
        closeButton.setContentHuggingPriority(.required, for: .horizontal)
        closeButton.setContentHuggingPriority(.required, for: .vertical)
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        // Enable user interaction for the label
        closeButton.isUserInteractionEnabled = true
        // Add target and action for the button
        let closeButtonGesture = UITapGestureRecognizer(target: self, action: #selector(closePageButton))
        closeButton.addGestureRecognizer(closeButtonGesture)
        
        let editAccountText = UILabel()
        editAccountText.text = "Edit"
        // Set bold font
        if let boldFont = UIFont(name: "Helvetica-Bold", size: 16) {
            editAccountText.font = boldFont
        }
        // Enable user interaction for the label
        editAccountText.isUserInteractionEnabled = true
        //add action
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editAccountButton))
        editAccountText.addGestureRecognizer(tapGesture)
        
        let title = UILabel()
        title.text = "Profile"
        title.textColor = .black
        if let boldFont = UIFont(name: "Helvetica-Bold", size: 16) {
            title.font = boldFont
        }
        
        // Add the items to the stack view
        appBar.addArrangedSubview(closeButton)
        appBar.addArrangedSubview(title)
        appBar.addArrangedSubview(editAccountText)
       
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
}

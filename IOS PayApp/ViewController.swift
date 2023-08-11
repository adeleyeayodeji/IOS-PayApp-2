//
//  ViewController.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 09/08/2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    let buttonHandler = FunctionHandlers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Disable dark mode
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        }
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
        let infoButton = UIButton(type: .system)
        infoButton.setImage(questionMarkImage, for: .normal)
        // Add target and action for the button
        infoButton.addTarget(buttonHandler, action: #selector(buttonHandler.infoButtonClicked), for: .touchUpInside)
    
        let addButton = UIImageView()
          
          // Load the image from URL using Kingfisher
          if let imageURL = URL(string: "https://cdn.pixabay.com/photo/2023/07/20/11/00/muffin-8139065_1280.jpg") {
              addButton.kf.setImage(with: imageURL)
              addButton.tintColor = .black  // Set image color
              addButton.isUserInteractionEnabled = true  // Enable user interaction
              // Set rounded corners and dimensions
              addButton.layer.cornerRadius = 15
              addButton.layer.masksToBounds = true
              addButton.translatesAutoresizingMaskIntoConstraints = false
              addButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
              addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
                //              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonTapped))
                //              addButton.addGestureRecognizer(tapGesture)
          } else {
              addButton.image = UIImage(systemName: "person")  // Set default image
          }
        
        
        // Add the items to the stack view
        appBar.addArrangedSubview(infoButton)
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
}


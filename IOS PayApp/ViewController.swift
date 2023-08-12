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
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Disable dark mode
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        }
        view.backgroundColor = .white
        containerMode()
    }
    
    @objc func gotoProfilePage(){
        // Create an instance of the profile view controller
        let profileViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = .fullScreen
        // Assuming you're using a navigation controller, push the profile view controller onto the navigation stack
        self.present(profileViewController, animated: true, completion: nil)
    }
    
    private func containerMode(){
        stackView.axis = .vertical // Use .horizontal for rows
       //pass header
        appHeader()
        //balanceSection
        balanceSection()
        
        // Add constraints to position and size the stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the container stack view to the main view
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    private func balanceSection(){
        let balanceView = UIStackView()
        balanceView.axis = .horizontal
        balanceView.alignment = .top
        
        //country select
//        let countryCard = SelectCountryCardView.createAndAddToSuperview(balanceView)
//        //add addArrangedSubview
//        balanceView.addArrangedSubview(countryCard)
        //balance view
        let balanceLabel = UIStackView()
        balanceLabel.axis = .vertical
        balanceLabel.spacing = 7
        //add text label
        let tlabel = UILabel()
        tlabel.text = "Your Balance"
        tlabel.font = UIFont.systemFont(ofSize: 13.1, weight: .light)
        tlabel.textColor = UIColor.gray // Set text color to grey
        
        //add the currency
        let cur = UILabel()
        cur.text = "NGN"

        cur.textColor = .black // Set text color if needed

        // Add right margin constraint
        cur.translatesAutoresizingMaskIntoConstraints = false
        cur.setContentHuggingPriority(.required, for: .horizontal) // Ensure the label won't compress
        //balance figure
        let blc = UILabel()
        blc.text = "0.00"
      
        // Load a custom bold font (make sure to replace "Custom-Bold-FontName" with the actual font name)
        if let boldFont = UIFont(name: "Helvetica-Bold", size: 19) {
            cur.font = boldFont
            blc.font = boldFont
        }
        //add hide icon
        let hideEye = UIImageView(
            image: UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        )
        hideEye.contentMode = .scaleAspectFit
        hideEye.setContentHuggingPriority(.required, for: .horizontal)
        hideEye.setContentHuggingPriority(.required, for: .vertical)
        hideEye.widthAnchor.constraint(equalToConstant: 20).isActive = true
        hideEye.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //cur stack
        let curStack = UIStackView(arrangedSubviews: [cur, blc])
        curStack.axis = .horizontal
        //add it to secondlabel
        let secondlabelStack = UIStackView(arrangedSubviews: [curStack, hideEye])
        secondlabelStack.axis = .horizontal
        curStack.alignment = .fill
        
        NSLayoutConstraint.activate([
            // Add a right margin
            cur.trailingAnchor.constraint(equalTo: secondlabelStack.trailingAnchor, constant: -307)
        ])
        //add to balanceLabel
        balanceLabel.addArrangedSubview(tlabel)
        balanceLabel.addArrangedSubview(secondlabelStack)
        
        //add it to balance View
        balanceView.addArrangedSubview(balanceLabel)
        
        //add view to general view
        stackView.addArrangedSubview(balanceView)
    }
    
    private func appHeader(){
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
               // Set border color and width
               addButton.layer.borderColor = UIColor.black.cgColor
               addButton.layer.borderWidth = 0.5
            
               addButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
               addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gotoProfilePage))
               addButton.addGestureRecognizer(tapGesture)
           } else {
               addButton.image = UIImage(systemName: "person")  // Set default image
           }
         
         
         // Add the items to the stack view
         appBar.addArrangedSubview(infoButton)
         appBar.addArrangedSubview(addButton)
         appBar.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0) // Add a 20-point bottom margin
         appBar.isLayoutMarginsRelativeArrangement = true
        
         stackView.addArrangedSubview(appBar)
    }
}


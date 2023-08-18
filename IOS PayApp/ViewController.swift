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
    
    private func add_cash(){
        let cardView = CustomCardView.createAndAddToSuperview(title: " Add Cash", icon: UIImage(systemName: "plus"), addImage: true)
        let cardView2 = CustomCardView.createAndAddToSuperview(title: " Add Cash", icon: UIImage(systemName: "arrow.2.squarepath"), addImage: true)
        let cardView3 = CustomCardView.createAndAddToSuperview(title: "", icon: UIImage(systemName: "ellipsis")?.withTintColor(.black, renderingMode: .alwaysOriginal), addImage: true)
        // Create a horizontal stack view for card view (if needed)
        let addcashView = UIStackView(arrangedSubviews: [
            cardView, cardView2
        ])
        
        cardView.setContentHuggingPriority(. required, for: .horizontal)
        cardView2.setContentHuggingPriority(. required, for: .horizontal)
        cardView3.setContentHuggingPriority(. required, for: .horizontal)
        
        addcashView.axis = .horizontal
        addcashView.alignment = .top
        addcashView.spacing = 15
        addcashView.distribution = .fillEqually
        
        addcashView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 15, right: 0) // Add a 20-point bottom margin
        addcashView.isLayoutMarginsRelativeArrangement = true
        
        // Create an empty space view
        let emptySpaceView = UIView()
        emptySpaceView.translatesAutoresizingMaskIntoConstraints = false
        emptySpaceView.widthAnchor.constraint(equalToConstant: 0).isActive = true // Adjust width as needed
        
        let newdd = UIStackView(arrangedSubviews: [cardView3, emptySpaceView])
        newdd.axis = .horizontal
        newdd.alignment = .center
        newdd.spacing = 2
        newdd.distribution = .fillEqually
        
        // Insert the empty space view into the stack view
        addcashView.addArrangedSubview(newdd)
        // Add the horizontal stack view (addcashView) to the main stack view (stackView)
        stackView.addArrangedSubview(addcashView)
    }
    
    private func containerMode(){
        stackView.axis = .vertical // Use .horizontal for rows
       //pass header
        appHeader()
        //balanceSection
        balanceSection()
        
        //add cash section
        add_cash()
        
        // Add constraints to position and size the stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // Add the container stack view to the main view
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
    }
    
    private func balanceSection(){
        let balanceView = UIStackView()
        balanceView.axis = .horizontal
        balanceView.alignment = .top
        
        
        //country select
        let countryCard = SelectCountryCardView.createAndAddToSuperview(balanceView)
        //add addArrangedSubview
        
        balanceView.addArrangedSubview(countryCard)
        //balance view
        let balanceLabel = UIStackView()
        balanceLabel.axis = .vertical
        balanceLabel.spacing = 7
        
        
        balanceLabel.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        balanceLabel.isLayoutMarginsRelativeArrangement = true

        //add text label
        let tlabel = UILabel()
        tlabel.text = "Your Balance"
        tlabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        tlabel.textColor = UIColor.gray // Set text color to grey
        
        
        //add the currency
        let cur = UILabel()
        //get user default for hide balance
        let hideBlc = UserDefaults.standard.string(forKey: "hidebalance")
        cur.addCustom(
            image: (UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal))!,
            text: hideBlc == "no" ? "NGN 0.00" : "NGN *****",
            isLeading: false
        )
        cur.sizeToFit()
        cur.layoutIfNeeded()
        cur.textColor = .black // Set text color if needed
        // Enable user interaction for the UIImageView
        cur.isUserInteractionEnabled = true
         
         // Add tap gesture recognizer to the UIImageView
        let curtapGesture = UITapGestureRecognizer(target: buttonHandler, action: #selector(buttonHandler.hideBalance))
        cur.addGestureRecognizer(curtapGesture)
      
        // Load a custom bold font (make sure to replace "Custom-Bold-FontName" with the actual font name)
        if let boldFont = UIFont(name: "Helvetica-Bold", size: 17.8) {
            cur.font = boldFont
        }
        
        //cur stack
        let curStack = UIStackView(arrangedSubviews: [cur])
        curStack.axis = .horizontal
        curStack.alignment = .center
        curStack.spacing = 0 // Remove spacing
        curStack.distribution = .fill
        
        //add to balanceLabel
        balanceLabel.addArrangedSubview(tlabel)
        balanceLabel.addArrangedSubview(curStack)
        
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

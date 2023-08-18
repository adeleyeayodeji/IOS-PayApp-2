//
//  InfoBottomSheet.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 10/08/2023.
//

import Foundation

import UIKit

class InfoBottomSheetViewController: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
        containerMode()
   }
    
    
    @objc private func handleTapOutside() {
      dismiss(animated: false, completion: nil)
    }
    
   private func containerMode(){
      view.backgroundColor = .clear
      
      let cardView = UIView()
      cardView.backgroundColor = .white
      cardView.layer.cornerRadius = 0
      cardView.layer.shadowColor = UIColor.black.cgColor
      cardView.layer.shadowOpacity = 0
      cardView.layer.shadowOffset = CGSize(width: 0, height: -2)
      cardView.layer.shadowRadius = 0
      
      let titleLabel = UILabel()
      titleLabel.text = "How can we help you 2?"
      titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
      titleLabel.textAlignment = .left
      
      let helpCenterView = createListItem(title: "Help Center", icon: UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal), description: "Some text with arrow forward to learn more")
      let chatWithUsView = createListItem(title: "Chat with us", icon: UIImage(systemName: "message")?.withTintColor(.black, renderingMode: .alwaysOriginal), description: "Some text with arrow forward to learn more")
      
      cardView.addSubview(titleLabel)
      cardView.addSubview(helpCenterView)
      cardView.addSubview(chatWithUsView)
      
      // Add constraints for titleLabel, helpCenterView, and chatWithUsView within cardView
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      helpCenterView.translatesAutoresizingMaskIntoConstraints = false
      chatWithUsView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
          titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
          titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
          helpCenterView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
          helpCenterView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
          helpCenterView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
          chatWithUsView.topAnchor.constraint(equalTo: helpCenterView.bottomAnchor, constant: 16),
          chatWithUsView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
          chatWithUsView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
          chatWithUsView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -40)
      ])
      
      view.addSubview(cardView)
      
      // Add constraints for cardView at the bottom with some padding
      cardView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
      ])
    }
       
   private func createListItem(title: String, icon: UIImage?, description: String) -> UIView {
       let itemView = UIView()
       itemView.backgroundColor = .clear
       
       let iconImageView = UIImageView(image: icon)
       iconImageView.contentMode = .scaleAspectFit
       iconImageView.setContentHuggingPriority(.required, for: .horizontal)
       iconImageView.setContentHuggingPriority(.required, for: .vertical)
       iconImageView.widthAnchor.constraint(equalToConstant: 23).isActive = true
       iconImageView.heightAnchor.constraint(equalToConstant: 23).isActive = true
       
       let titleLabel = UILabel()
       titleLabel.text = title
       titleLabel.textAlignment = .left
       titleLabel.font = UIFont.boldSystemFont(ofSize: 14.5)
       
       let descriptionLabel = UILabel()
       descriptionLabel.text = description
       descriptionLabel.textAlignment = .left
       descriptionLabel.font = UIFont.systemFont(ofSize: 12.5)
       descriptionLabel.numberOfLines = 0
       
       let arrowImageView = UIImageView(image: UIImage(systemName: "arrow.forward.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal))
       arrowImageView.contentMode = .scaleAspectFit
       
       let descIcon = UIStackView(arrangedSubviews: [descriptionLabel, arrowImageView])
       descIcon.axis = .horizontal
       descIcon.spacing = 8
       
       let contentStack = UIStackView(arrangedSubviews: [titleLabel, descIcon])
       contentStack.axis = .vertical
       contentStack.spacing = 0
       
       let stackView = UIStackView(arrangedSubviews: [iconImageView, contentStack])
       stackView.axis = .horizontal
       stackView.spacing = 15
       stackView.alignment = .center
       
       itemView.addSubview(stackView)
       
       // Add constraints for stackView within itemView
       stackView.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
           stackView.topAnchor.constraint(equalTo: itemView.topAnchor, constant: 8),
           stackView.leadingAnchor.constraint(equalTo: itemView.leadingAnchor, constant: 0),
           stackView.trailingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: -16),
           stackView.bottomAnchor.constraint(equalTo: itemView.bottomAnchor, constant: -8)
       ])
       
       return itemView
   }
}

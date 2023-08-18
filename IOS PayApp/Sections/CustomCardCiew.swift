import UIKit

class CustomCardView: UIView {
    
    static func createAndAddToSuperview(title: String, icon: UIImage?, addImage: Bool) -> CustomCardView {
          let customCard = CustomCardView()
          customCard.setupUI(title: title, icon: icon!, addImage: addImage)
          return customCard
    }
    
    private func setupUI(title: String, icon: UIImage?, addImage: Bool) {
        
        
        // Configure UI elements and layout here
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 4
        
        //check if title string is empty
        if(!title.isEmpty){
            let label = UILabel()
            //check if add image is false
            if(addImage){
                label.addCustom(image: icon!, text: title)
            }else{
                label.text = title
            }
            label.sizeToFit()
            if let boldFont = UIFont(name: "Helvetica-Bold", size: 13) {
                label.font = boldFont
            }
            label.layoutIfNeeded()
            label.textColor = .black // Set text color if needed
            // Enable user interaction for the UIImageView
            label.isUserInteractionEnabled = true
            
            // Stack View
            let stackView = UIStackView(arrangedSubviews: [label])
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .fill
            
            addSubview(stackView)
            
            // Set stackView's constraints
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                // Set a specific width constraint for the stackView
                stackView.widthAnchor.constraint(equalToConstant: 10),
                stackView.heightAnchor.constraint(equalToConstant: 15)
                
            ])
        }else{
            //do only image
            let label = UIImageView()
            label.image = icon!
            
            // Stack View
            let stackView = UIStackView(arrangedSubviews: [label])
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .fill
            
            addSubview(stackView)
            
            // Set stackView's constraints
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
        }
    }
}

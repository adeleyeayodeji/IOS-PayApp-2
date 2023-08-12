import UIKit

class SelectCountryCardView: UIView {
    
    static func createAndAddToSuperview(_ superview: UIStackView) -> SelectCountryCardView {
          let countryCard = SelectCountryCardView()
          countryCard.setupUI()
          return countryCard
    }
    
    private func setupUI() {
        let countryImage = UIImageView(image: UIImage(named: "Nigeria-Flag-icon.png"))
        let selectIcon = UIImageView(
            image: UIImage(
                systemName: "arrowtriangle.down.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
  
        selectIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        selectIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Set constraints for width and height of countryImage
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.contentMode = .scaleAspectFit
        countryImage.layer.shadowColor = UIColor.black.cgColor
        countryImage.layer.shadowOpacity = 0.2
        countryImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        countryImage.layer.shadowRadius = 4
        
        // Configure UI elements and layout here
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 4
        
        // Configure selectIcon
        selectIcon.translatesAutoresizingMaskIntoConstraints = false
        selectIcon.contentMode = .scaleAspectFit
        
        // Stack View
        let stackView = UIStackView(arrangedSubviews: [countryImage, selectIcon])
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        // Set stackView's constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            // Set a specific width constraint for the stackView
            stackView.widthAnchor.constraint(equalToConstant: 50),
            stackView.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}

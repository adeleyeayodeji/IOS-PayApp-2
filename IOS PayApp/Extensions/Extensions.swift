//
//  Extensions.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 16/08/2023.
//

import Foundation
import UIKit


extension UILabel {
    func addCustom(image: UIImage, text: String, isLeading: Bool = true, imageBounds: CGRect = CGRect(x: 0, y: 0, width: 28, height: 12)) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.bounds = imageBounds
        
        let targetSize = CGSize(width: 50, height: 50)

        let scaledImage = image.scalePreservingAspectRatio(
            targetSize: targetSize
        )
        
        imageAttachment.image = scaledImage.withLeftMargin(30)
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let string = NSMutableAttributedString(string: text)
        
        let mutableAttributedString = NSMutableAttributedString()
        
        if isLeading {
            mutableAttributedString.append(attachmentString)
            mutableAttributedString.append(string)
            attributedText = mutableAttributedString
        } else {
            string.append(attachmentString)
            attributedText = string
        }
    }
}


extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
    
    
    func withLeftMargin(_ margin: CGFloat) -> UIImage? {
          let newSize = CGSize(width: size.width + margin, height: size.height)
          
          UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
          draw(at: CGPoint(x: margin, y: 0))
          let newImage = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()
          
          return newImage
    }
}

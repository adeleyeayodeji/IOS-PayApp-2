//
//  Partial.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 12/08/2023.
//

import Foundation

import UIKit

class InfoBottomSheetViewControllerPartial: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
        // Add a semi-transparent background view
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView.frame = view.bounds
        // Add a tap gesture recognizer to the view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutside))
        backgroundView.addGestureRecognizer(tapGesture)
        view.addSubview(backgroundView)
   }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadSlideUpView()
        
    }
    
    
    private func loadSlideUpView() {
        // Create an instance of InfoBottomSheetViewController
        let bottomSheetViewController = InfoBottomSheetViewController()

        // Set initial frame for the bottom sheet (off-screen)
        bottomSheetViewController.view.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 300)

        // Add the bottom sheet view controller's view as a subview to your main view controller's view
        view.addSubview(bottomSheetViewController.view)

        // Perform the animation to slide the bottom sheet up
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            bottomSheetViewController.view.frame.origin.y = self.view.frame.height - 300 // Final position at the desired height
        }, completion: nil)
    }
    
    
   @objc private func handleTapOutside() {
      dismiss(animated: false, completion: nil)
   }
}

//
//  Partial.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 12/08/2023.
//

import Foundation

import UIKit

class InfoBottomSheetViewControllerPartial: UIViewController {
    
    private var bottomSheetViewController: InfoBottomSheetViewController?
    
    override func viewDidLoad() {
       super.viewDidLoad()
        // Add a semi-transparent background view
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
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
         bottomSheetViewController = InfoBottomSheetViewController()

         // Set initial frame for the bottom sheet (off-screen)
         bottomSheetViewController?.view.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 200)

         // Add the bottom sheet view controller as a child view controller
         addChild(bottomSheetViewController!)
         view.addSubview(bottomSheetViewController!.view)
         bottomSheetViewController!.didMove(toParent: self)

         // Perform the animation to slide the bottom sheet up
         UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
             self.bottomSheetViewController?.view.frame.origin.y = self.view.frame.height - 200 // Final position at the desired height
         }, completion: nil)
    }
    
    
   @objc private func handleTapOutside() {
       // Slide down the InfoBottomSheetViewController before closing the presentation
         UIView.animate(withDuration: 0.2, animations: {
             self.bottomSheetViewController?.view.frame.origin.y = self.view.frame.height
         }) { _ in
             self.bottomSheetViewController?.willMove(toParent: nil)
             self.bottomSheetViewController?.view.removeFromSuperview()
             self.bottomSheetViewController?.removeFromParent()
             self.bottomSheetViewController = nil
             
            //close modal
            self.dismiss(animated: false, completion: nil)
         }
   }
}

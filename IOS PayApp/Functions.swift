//
//  Functions.swift
//  IOS PayApp
//
//  Created by Adeleye Ayodeji on 10/08/2023.
//

import Foundation
import UIKit

class FunctionHandlers: NSObject {
    
    @objc func infoButtonClicked() {
        
       let bottomSheetViewController = InfoBottomSheetViewController()
       bottomSheetViewController.modalPresentationStyle = .overCurrentContext

       if let presentingViewController = UIApplication.shared.keyWindow?.rootViewController {
           
           bottomSheetViewController.modalPresentationStyle = .overCurrentContext
           
          presentingViewController.present(bottomSheetViewController, animated: false, completion: nil)
       }
    }
}

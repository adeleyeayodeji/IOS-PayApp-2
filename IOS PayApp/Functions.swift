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
        
       let bottomSheetViewController = InfoBottomSheetViewControllerPartial()
       bottomSheetViewController.modalPresentationStyle = .overCurrentContext

       if let presentingViewController = UIApplication.shared.keyWindow?.rootViewController {
           
          bottomSheetViewController.modalPresentationStyle = .overCurrentContext
           
          presentingViewController.present(bottomSheetViewController, animated: false, completion: nil)
       }
    }
    
    @objc func hideBalance(sender: UITapGestureRecognizer){
        if let label = sender.view as? UILabel {
            let string = label.text
            if string!.contains("*") {
                label.addCustom(
                    image: (UIImage(systemName: "eye")?.withTintColor(.black, renderingMode: .alwaysOriginal))!,
                    text: "NGN 0.00",
                    isLeading: false
                )
                //update user default
                UserDefaults.standard.setValue("no", forKey: "hidebalance")
            }else{
                label.addCustom(
                    image: (UIImage(systemName: "eye.slash")?.withTintColor(.black, renderingMode: .alwaysOriginal))!,
                    text: "NGN *****",
                    isLeading: false
                )
                //update user default
                UserDefaults.standard.setValue("yes", forKey: "hidebalance")
            }
        }
    }
}

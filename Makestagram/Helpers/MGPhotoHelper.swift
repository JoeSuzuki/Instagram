//
//  MGPhotoHelper.swift
//  Makestagram
//
//  Created by Joe Suzuki on 7/12/17.
//  Copyright © 2017 JoeSuzuki. All rights reserved.
//

/*
 1. Presenting the popover to allow the user to choose between taking a new photo or selecting one from the photo library
 2. Depending on the user's selection, presenting the camera or photo library
 3. Returning the image that the user has taken or selected
 */

import UIKit

class MGPhotoHelper: NSObject {
    
    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
    func presentActionSheet(from viewController: UIViewController) {
        // 1 Initialize a new UIAlertController of type actionSheet. UIAlertController can be used to present different types of alerts. An action sheet is a popup that will be displayed at the bottom edge of the screen.
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        // 2 Check if the current device has a camera available. The simulator doesn't have a camera and won't execute the if clause.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // 3 Create a new UIAlertAction. Each UIAlertAction represents an action on the UIAlertController. As part of the UIAlertAction initializer, you can provide a title, style, and handler that will execute when the action is selected.
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                // do nothing yet...
            })
            
            // 4 Add the action to the alertController instance we created.
            alertController.addAction(capturePhotoAction)
        }
        
        // 5 Repeat the previous sets 2-4 for the user's photo library.
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                // do nothing yet...
            })
            
            alertController.addAction(uploadAction)
        }
        
        // 6 Add a cancel action to allow an user to close the UIAlertController action sheet. Notice that the style is .cancel instead of .default.
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 7 Present the UIAlertController from our UIViewController. Remember, we must pass in a reference from the view controller presenting the alert controller for this method to properly present the UIAlertController.
        viewController.present(alertController, animated: true)
    }
}

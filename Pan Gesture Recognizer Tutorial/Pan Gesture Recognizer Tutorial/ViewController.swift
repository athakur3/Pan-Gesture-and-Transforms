//
//  ViewController.swift
//  Pan Gesture Recognizer Tutorial
//
//  Created by Akshansh Thakur on 16/11/20.
//

import UIKit

// This is the basics of pan gesture recognizer, we can play with states of pan gesture to get more advanced functionality, but for now, we will just work with the basic functionality.

class ViewController: UIViewController {
    
    @IBOutlet weak var globeImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Declare Pan Gesture
        let panGesture = UIPanGestureRecognizer()
        
        // Add target and action to the pan gesture.
        // Target is the one who will implement the action method.
        panGesture.addTarget(self, action: #selector(userDragged(_:)))
                
        // Add pan gesture to the view that you want to move around.
        globeImage.addGestureRecognizer(panGesture)
        
        // Enable user Interaction in case this is a label, image etc.
        globeImage.isUserInteractionEnabled = true
        
    }
    
    // An Objective C method that gets triggered when tap occurs in a view that tap gesture is added to.
    @objc func userDragged(_ gesture: UIPanGestureRecognizer) {
        
        // Now to track the user's figure movement in the root view of view controller, use:
        let movementCoordinates = gesture.translation(in: view)
        
        // Get the x and y coordinates of the gesture's movement. This is the distance that the finger has traversed from the start of the panning.
        let movementInXDirection = movementCoordinates.x
        let movementInYDirection = movementCoordinates.y
        
        switch gesture.state {
        case .ended:
            // When the pan gesture ends, we want the image to return back to it's original position, hence .identity.
            UIView.animate(withDuration: 0.5) {
                self.globeImage.transform = .identity
            }
        default:
            // This code makes sure that the view follow's the finger of the user.
            UIView.animate(withDuration: 0.2) {
                self.globeImage.transform = CGAffineTransform(translationX: movementInXDirection, y: movementInYDirection)
                
            }
        }
        
    }


}


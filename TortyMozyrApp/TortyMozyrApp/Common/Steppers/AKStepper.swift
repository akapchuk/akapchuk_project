//
//  AKStepper.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 17.03.21.
//

import UIKit

class AKStepper: UIStepper {

    override func decrementImage(for state: UIControl.State) -> UIImage? {
        return UIImage(systemName: "minus.circle")
    }
    
    override func incrementImage(for state: UIControl.State) -> UIImage? {
        return UIImage(systemName: "plus.circle.fill")
    }

}

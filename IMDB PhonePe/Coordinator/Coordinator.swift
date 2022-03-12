//
//  Coordinator.swift
//  IMDB PhonePe
//
//  Created by Poonamchand Raykhere on 12/03/22.
//

import UIKit

public protocol Coordinator {
    
    var navigationController: UINavigationController? {get set}
    
    func viewController() -> UIViewController?
    func route()
}


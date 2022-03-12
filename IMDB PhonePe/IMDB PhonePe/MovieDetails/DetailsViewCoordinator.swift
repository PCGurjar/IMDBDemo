//
//  DetailsViewCoordinator.swift
//  IMDB PhonePe
//
//  Created by Poonamchand Raykhere on 12/03/22.
//

import UIKit

class DetailsViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var model: Movie?
    
    init(controller: UINavigationController?, model: Movie) {
        navigationController = controller
        self.model = model
    }
    
    func viewController() -> UIViewController? {
        guard let m = model else {
            return nil
        }
        let vc = MovieDetailsViewController(model: m)
        return vc
    }
    
    func route() {
        guard let controller = viewController() else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}


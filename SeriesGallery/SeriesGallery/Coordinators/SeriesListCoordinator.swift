//
//  SeriesListCoordinator.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation
import UIKit

class SeriesListCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
        
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let seriesListVC : ViewController = ViewController()
        self.navigationController.viewControllers = [seriesListVC]
    }
    
}

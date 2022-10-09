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
        navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController = navigationController
    }
    
    func start() {
        let seriesListVC : ViewController = ViewController()
        seriesListVC.title = "Series Gallery"
        self.navigationController.viewControllers = [seriesListVC]
    }
    
}

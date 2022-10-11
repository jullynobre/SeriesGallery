//
//  SerieViewCoordinator.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 09/10/22.
//

import UIKit

class SerieViewCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
        
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let viewModel = SerieViewModel()
//        let seriesListVC : SearchViewController = SearchViewController(viewModel: viewModel)
//        seriesListVC.title = "Series Gallery"
//        self.navigationController.viewControllers = [seriesListVC]
    }
    
}

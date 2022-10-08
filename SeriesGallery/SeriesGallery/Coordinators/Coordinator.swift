//
//  Coordinator.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
        
    var childCoordinators: [Coordinator] { get set }
    
    init(navigationController:UINavigationController)
    
    func start()

}

public extension Coordinator {
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}

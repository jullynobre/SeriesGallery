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

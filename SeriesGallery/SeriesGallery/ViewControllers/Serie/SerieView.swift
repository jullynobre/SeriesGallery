//
//  SerieViewController.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 09/10/22.
//

import UIKit

class SerieViewController: AppController {
    
    private let viewModel: SerieViewModel
    
    // MARK: - Inits
    
    required init(viewModel: SerieViewModel) {
        self.viewModel = viewModel
        super.init()
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
        ])
        
    }
}



extension SerieViewController: RequestDelegate {
    
    func didUpdate(with state: ViewState) {
        
    }
    
    
}

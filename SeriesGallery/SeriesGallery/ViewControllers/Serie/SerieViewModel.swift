//
//  SerieViewModel.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 09/10/22.
//

import Foundation
import UIKit

final class SerieViewModel {
    
    weak var delegate: RequestDelegate?
    
    private var state: ViewState {
        didSet {
            self.delegate?.didUpdate(with: state)
        }
    }
    
    private var serie: Serie?
    
    init () {
        self.state = .idle
    }
    
}


// MARK: Datasource

extension SerieViewModel {
    
    func getInfo()  {
        
    }
    
}

// MARK: Service

extension SerieViewModel {
    
    func loadData() {
        self.state = .loading
        
        SeriesGalleryService.searchSeries(query: "") { result in
            switch result {
            case let .failure(error):
//                self.series = []
                self.state = .error(error)
            case .success(_):
//                self.series = series
                self.state = .success
            }
        }
    }
    
}

//
//  SearchViewModel.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation

final class SearchViewModel {
    
    weak var delegate: RequestDelegate?
    
    private var state: ViewState {
        didSet {
            self.delegate?.didUpdate(with: state)
        }
    }
    
    private var series: [Serie] = []
    
    init () {
        self.state = .idle
    }
    
}

// MARK: Datasource

extension SearchViewModel {
    
    func getInfo(for indexPath: IndexPath) -> String {
        let serie = series[indexPath.row]
        return serie.name
    }
    
}

// MARK: Service

extension SearchViewModel {
    
    func loadData() {
        self.state = .loading
        
        SeriesGalleryService.searchSeries(query: "") { result in
            switch result {
            case let .failure(error):
                self.series = []
                self.state = .error(error)
            case let .success(showArray):
                self.series = showArray.map({ show in
                    return show.show
                })
                self.state = .success
            }
        }
    }
    
}

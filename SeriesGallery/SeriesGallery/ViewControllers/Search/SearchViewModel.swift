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
    
    func getNumberOfRows() -> Int {
        return self.series.count
    }
}

// MARK: Service

extension SearchViewModel {
    
    func searchSeries(query: String) {
        self.state = .loading
        
        SeriesGalleryService.searchSeries(query: query) { result in
            switch result {
            case let .failure(error):
                self.series = []
                self.state = .error(error)
            case let .success(series):
                self.series = series
                self.state = .success
            }
        }
    }
    
}

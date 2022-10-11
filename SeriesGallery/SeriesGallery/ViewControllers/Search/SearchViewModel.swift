//
//  SearchViewModel.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import UIKit

final class SearchViewModel {
    
    weak var delegate: RequestDelegate?
    
    private var state: ViewState {
        didSet {
            self.delegate?.didUpdate(with: state)
        }
    }
    
    private var series: [SerieModel] = []
    
    init () {
        self.state = .idle
    }
    
}

// MARK: Datasource

extension SearchViewModel {
    
    func getInfo(for indexPath: IndexPath) -> (name: String, image: UIImage?) {
        let serie = series[indexPath.row]
        return (serie.name, serie.image)
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
                self.loadImages()
            }
        }
    }
    
    private func loadImages() {
        for i in 0..<series.count {
            guard let imageURL = self.series[i].imageURL else { return }
            SeriesGalleryService.downlaoadImage(url: imageURL) { result in
                switch result {
                case let .success(image):
                    self.series[i].image = image
                    self.state = .relaodRow(IndexPath(row: i, section: 0))
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
}

//
//  SeriesGalleryTests.swift
//  SeriesGalleryTests
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import XCTest
@testable import SeriesGallery

class SeriesGalleryTests: XCTestCase {
    
    private var searchViewModel: SearchViewModel!
    private var seriesGalleryService: MockSeriesGalleryService!
    
    override func setUpWithError() throws {
        seriesGalleryService = MockSeriesGalleryService()
        searchViewModel = SearchViewModel()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        searchViewModel = nil
        seriesGalleryService = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MockSeriesGalleryService: SeriesGalleryService {
    var searchSeriesMockResult: Result<[SerieModel], Error>?
    
    func searchSeries(query: String, completion: @escaping (Result<[SerieModel], Error>) -> Void) {
        if let result = searchSeriesMockResult {
            completion(result)
        }
    }
}

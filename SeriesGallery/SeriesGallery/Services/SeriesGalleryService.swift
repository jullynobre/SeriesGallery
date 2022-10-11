//
//  SeriesGalleryService.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation
import UIKit

final class SeriesGalleryService {
    private static let baseURL = "https://api.tvmaze.com/"

    private enum Endpoint {
        case search

        var path: String {
            switch self {
                case .search: return "/search/shows"
            }
        }

        var url: String {
            switch self {
                case .search: return "\(baseURL)\(path)"
            }
        }
    }
    
    static func searchSeries(query: String, completion: @escaping (Result<[SerieModel], Error>) -> Void) {
        let formattedQuery = String(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        guard let url = URL(string: "\(Endpoint.search.url)?q=\(formattedQuery)") else {
            //completion(.failure(error))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(#function, "🧨 Request: \(request)\nError: \(error)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                // error with the data
                return
            }

            do {
                let seriesResponse = try JSONDecoder().decode([Show].self, from: data)
                let series: [SerieModel] = seriesResponse.map({ serieResponse in
                    let model = SerieModel(name: serieResponse.show.name,
                                           schedule: serieResponse.show.schedule,
                                           genres: serieResponse.show.genres,
                                           summary: serieResponse.show.summary,
                                           imageURL: serieResponse.show.image?.medium,
                                           image: nil)
                    return model
                })
                completion(.success(series))
            } catch let error {
                print(#function, "🧨 Request: \(request)\nError: \(error)")
                completion(.failure(error))
            }

        }.resume()

    }
    
    static func downlaoadImage(url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(#function, "🧨 Request: \(request)\nError: \(error)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                // error with the data
                return
            }

            guard let image = UIImage(data: data) else {
                print(#function, "🧨 Request: \(request)\nError: Error while trying to convert data to UIImage")
                return
//                completion(.failure(Error))
            }
                           
            completion(.success(image))
        }.resume()
    }
}

//
//  SeriesGalleryService.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation

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
    
    static func searchSeries(query: String, completion: @escaping (Result<[Serie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Endpoint.search.url)?q=\(query)") else {
            //Error
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
                let shows = try JSONDecoder().decode([Show].self, from: data)
                let series = shows.map({ show in
                    return show.show
                })
                completion(.success(series))
            } catch let error {
                print(#function, "🧨 Request: \(request)\nError: \(error)")
                completion(.failure(error))
            }

        }.resume()

    }
}

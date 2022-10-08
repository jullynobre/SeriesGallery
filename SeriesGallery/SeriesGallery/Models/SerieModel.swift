//
//  SerieModel.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation

struct Show: Codable {
    let show: Serie
}

struct Serie: Codable {
    let name: String
    let schedule: Schedule
    let genres: [String]
    let summary: String?
}

struct Schedule: Codable {
    let time: String
    let days: [String]
    
}

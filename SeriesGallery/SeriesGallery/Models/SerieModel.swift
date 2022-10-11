//
//  SerieModel.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation
import UIKit

struct Show: Codable {
    let show: Serie
}

struct Serie: Codable {
    let name: String
    let schedule: Schedule
    let genres: [String]
    let summary: String?
    let image: Image?
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}

struct Image: Codable {
    let medium: String
    let original: String
}

struct SerieModel {
    let name: String
    let schedule: Schedule
    let genres: [String]
    let summary: String?
    let imageURL: String?
    var image: UIImage?
}

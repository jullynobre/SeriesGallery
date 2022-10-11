//
//  RequestDelegate.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case success
    case error(Error)
    case relaodRow(IndexPath)
}

protocol RequestDelegate: AnyObject {
    func didUpdate(with state: ViewState)
}

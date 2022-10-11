//
//  SearchResultCell.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 09/10/22.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    lazy var serieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var serieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(serieNameLabel)
        self.addSubview(serieImage)
        
        NSLayoutConstraint.activate([
            serieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            serieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            serieImage.widthAnchor.constraint(equalToConstant: 52),
            serieImage.heightAnchor.constraint(equalToConstant: 68),
            
            serieNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            serieNameLabel.leadingAnchor.constraint(equalTo: serieImage.trailingAnchor, constant: 8),
            serieNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            serieNameLabel.bottomAnchor.constraint(equalTo: serieImage.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

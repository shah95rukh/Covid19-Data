//
//  CovidDataCell.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-29.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit

class CovidDataCell: UITableViewCell {
    
    let flag: UIImageView = {
        let flagImage = UIImageView()
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        return flagImage
    }()
    let countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let confimredLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let deathsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.addSubview(flag)
        contentView.addSubview(countryLabel)
        contentView.addSubview(confimredLabel)
        contentView.addSubview(deathsLabel)
        
        NSLayoutConstraint.activate([
            flag.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            flag.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            flag.widthAnchor.constraint(equalToConstant: 32),
            flag.heightAnchor.constraint(equalToConstant: 25),
            
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            countryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            countryLabel.leadingAnchor.constraint(equalTo: flag.trailingAnchor, constant: 10),
            countryLabel.widthAnchor.constraint(equalToConstant: 110),
            
            deathsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            deathsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            deathsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            confimredLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            confimredLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            confimredLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -105),
        ])
    }
}

//
//  CovidDataCell.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-29.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit

class CovidDataCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var confirmedCasesLabel: UILabel!
    @IBOutlet weak var recoveredCasesLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

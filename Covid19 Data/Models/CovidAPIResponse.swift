//
//  CovidAPIResponse.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-29.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import Foundation
import UIKit

struct APIdetails: Decodable {
    let Date: String
    let Countries: [Covid]
}

struct Covid: Decodable {
    let CountryCode: String
    let Country: String
    let TotalConfirmed: Int
    let TotalRecovered: Int
    let TotalDeaths: Int
    let NewConfirmed: Int
    let NewRecovered: Int
    let NewDeaths: Int
}

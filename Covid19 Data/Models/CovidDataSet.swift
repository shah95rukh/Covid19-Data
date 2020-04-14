//
//  CovidDataSet.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-30.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import Foundation

class CovidDataModel {
    let CountryCodeArray: String
    let countryArray: String
    let totalConfirmedArray: Int
    let totalRecoveredArray: Int
    let totalDeathsArray: Int
    let newConfirmedArray: Int
    let newRecoveredArray: Int
    let newDeathsArray: Int
        
    init(CountryCodeArray: String, countryArray: String, totalConfirmedArray: Int, totalRecoveredArray: Int, totalDeathsArray: Int, newConfirmedArray: Int, newRecoveredArray: Int, newDeathsArray: Int) {
        self.CountryCodeArray = CountryCodeArray
        self.countryArray = countryArray
        self.totalConfirmedArray = totalConfirmedArray
        self.totalRecoveredArray = totalRecoveredArray
        self.totalDeathsArray = totalDeathsArray
        self.newConfirmedArray = newConfirmedArray
        self.newRecoveredArray = newRecoveredArray
        self.newDeathsArray = newDeathsArray
    }
}


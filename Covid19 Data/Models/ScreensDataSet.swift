//
//  ScreensDataSet.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-04-15.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import Foundation
import UIKit

enum Screens: CaseIterable {
    case firstScreen
    case secondScreen
    case thirdScreen
    
    var name: String {
        switch self {
        case .firstScreen:
            return "WHAT IS \nCOVID-19?"
        case .secondScreen:
            return "HOW IT \nSPREADS?"
        case .thirdScreen:
            return "HOW TO \nPROTECT?"
        }
    }
    
    var desc: String {
        switch self {
        case .firstScreen:
            return "Coronavirus disease (COVID-19) is an infectious disease caused by a new virus.\nThe disease causes respiratory illness (like the flu) with symptoms such as a cough, fever, and in more severe cases, difficulty breathing."
        case .secondScreen:
            return "Coronavirus disease spreads primarily through contact with an infected person when they cough or sneeze. It also spreads when a person touches a surface or object that has the virus on it, then touches their eyes, nose, or mouth."
        case .thirdScreen:
            return "You can protect yourself by washing your hands frequently, avoiding touching your face, and avoiding close contact (1 meter or 3 feet) with people who are unwell."
        }
    }
    
    var iconName: String {
        switch self {
        case .firstScreen:
            return "img1"
        case .secondScreen:
            return "img2"
        case .thirdScreen:
            return "img3"
        }
    }
    
    var bgName: UIColor {
        switch self {
        case .firstScreen:
            return .systemIndigo
        case .secondScreen:
                return .systemOrange
        case .thirdScreen:
            return .systemPink
        }
    }
    
    var index: Int {
        switch self {
        case .firstScreen:
            return 0
        case .secondScreen:
            return 1
        case .thirdScreen:
            return 2
        }
    }
}

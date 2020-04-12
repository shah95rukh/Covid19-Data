//
//  DetailsViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-04-11.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import FlagKit
import Lottie

class DetailsViewController: UIViewController {
    var totalDataRow: [String: Int] = [:]
    var newDataRow: [String: Int] = [:]
    
    let countryName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpData(covid: CovidDataModel)  {
        countryName.text = covid.countryArray
        totalDataRow = ["TOTAL\nCONFIRMED": covid.totalConfirmedArray,
                        "TOTAL\nRECOVERED": covid.totalRecoveredArray,
                        "TOTAL\nDEATHS": covid.totalDeathsArray]
        
        newDataRow = ["NEW\nCONFIRMED": covid.newConfirmedArray,
                      "NEW\nRECOVERED": covid.newRecoveredArray,
                      "NEW\nDEATHS": covid.newDeathsArray]
    }
    
    func createCards(tag: String, label: Int, backgroundColor: UIColor) -> UIView {
        let cardView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 13
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = CGSize(width: 0, height: 0)
            view.layer.shadowRadius = 10
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        let dataTag: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let dataLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let dataStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            return stackView
        }()
        
        dataTag.text = tag
        dataLabel.text = "\(label)"
        dataStackView.addArrangedSubview(dataTag)
        dataStackView.addArrangedSubview(dataLabel)
        cardView.backgroundColor = backgroundColor
        cardView.addSubview(dataStackView)
        
        NSLayoutConstraint.activate([
            dataStackView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            dataStackView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
        ])
        return cardView
    }
    
    func stackRow(myRow: Dictionary<String, Int>, cardBackground: [UIColor]) -> UIStackView {
        let totalStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            return stackView
        }()
        
        var i = 0
        for (tag, label) in myRow {
            totalStackView.addArrangedSubview(createCards(tag: tag, label: label, backgroundColor: cardBackground[i]))
            i += 1
        }
        
        view.addSubview(totalStackView)
        return totalStackView
    }
    
    let EntireStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        return stackView
    }()
    
    let titleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Details"
                
        titleStack.addArrangedSubview(countryName)
        EntireStackView.addArrangedSubview(titleStack)
        EntireStackView.addArrangedSubview(stackRow(myRow: totalDataRow, cardBackground: [UIColor.systemIndigo, UIColor.systemPink, UIColor.systemOrange]))
        EntireStackView.addArrangedSubview(stackRow(myRow: newDataRow, cardBackground: [UIColor.systemBlue, UIColor.systemPurple, UIColor.systemGreen]))

        view.addSubview(EntireStackView)
        
        NSLayoutConstraint.activate([
            EntireStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            EntireStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            EntireStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            EntireStackView.heightAnchor.constraint(equalToConstant: 520),
        ])
    }
}

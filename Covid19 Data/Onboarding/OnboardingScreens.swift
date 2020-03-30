//
//  OnboardingScreens.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-30.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class OnboardingScreens: UIViewController {
    
    var onboardScreen: Screens
    
    init(with screen: Screens) {
        self.onboardScreen = screen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cardFrame: EMTNeumorphicView = {
        let firstView = EMTNeumorphicView()
        firstView.neumorphicLayer?.cornerRadius = 22.5
        firstView.translatesAutoresizingMaskIntoConstraints = false
        return firstView
    }()
    
    let headingTitle: UILabel = {
        let heading = UILabel()
        heading.font = UIFont(name: "Futura-Bold", size: 27)
        heading.numberOfLines = 0
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    let details: UILabel = {
        let description =  UILabel()
        let text = "Hi"
        description.font = UIFont(name: "Futura", size: 20)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        description.attributedText = attributedString
        return description
    }()
    
    let iconFrame: EMTNeumorphicButton = {
        let button = EMTNeumorphicButton(type: .custom)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 18, bottom: 16, right: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = true
        button.neumorphicLayer?.cornerRadius = 22.5
        return button
    }()
    
    let startButton: UIButton = {
        let start = UIButton()
        start.setTitle("Start", for: .normal)
        start.titleLabel?.font = UIFont(name: "Futura-Bold", size: 20)
        start.setTitleColor(.black, for: .normal)
        start.translatesAutoresizingMaskIntoConstraints = false
        start.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        return start
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.offWhite
        cardFrame.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        iconFrame.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        
        headingTitle.text = onboardScreen.name
        details.text = onboardScreen.desc
        iconFrame.setImage(UIImage(named: onboardScreen.iconName), for: .selected)
        startButton.isHidden = true
        
        if onboardScreen.index == 2 {
            startButton.isHidden = false
        }
        
        view.addSubview(cardFrame)
        view.addSubview(headingTitle)
        view.addSubview(details)
        view.addSubview(iconFrame)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            iconFrame.widthAnchor.constraint(equalToConstant: 70),
            iconFrame.heightAnchor.constraint(equalToConstant: 70),
            iconFrame.topAnchor.constraint(equalTo: cardFrame.topAnchor, constant: 20),
            iconFrame.trailingAnchor.constraint(equalTo: cardFrame.trailingAnchor, constant: -20),
            
            headingTitle.bottomAnchor.constraint(equalTo: cardFrame.topAnchor, constant: -40),
            headingTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            headingTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            details.topAnchor.constraint(equalTo: cardFrame.topAnchor, constant: 75),
            details.leadingAnchor.constraint(equalTo: cardFrame.leadingAnchor, constant: 30),
            details.trailingAnchor.constraint(equalTo: cardFrame.trailingAnchor, constant: -30),
            
            cardFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cardFrame.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cardFrame.heightAnchor.constraint(equalToConstant: 400),
            cardFrame.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            cardFrame.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            startButton.topAnchor.constraint(equalTo: cardFrame.bottomAnchor, constant: 40),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    @objc func tapped(_ button: UIButton) {
       // performSegue(withIdentifier: "data", sender: self)
    }
    
}

extension UIColor {
    static let offWhite = UIColor(red: 225/255, green: 225/255, blue: 235/255, alpha: 1.0)
    // static let lightBlue = UIColor(red: 0.91, green: 0.93, blue: 0.95, alpha: 1.0)
}

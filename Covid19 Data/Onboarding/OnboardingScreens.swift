//
//  OnboardingScreens.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-30.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import Lottie

class OnboardingScreens: UIViewController {
    
    var onboardScreen: Screens
    
    init(with screen: Screens) {
        self.onboardScreen = screen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let illustration: UIImageView = {
        let imageIcon = UIImageView()
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        return imageIcon
    }()
    let headingTitle: UILabel = {
        let heading = UILabel()
        heading.font = UIFont.systemFont(ofSize: 27, weight: .black)
        heading.textColor = .white
        heading.numberOfLines = 0
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    let details: UILabel = {
        let description =  UILabel()
        let text = "Hi"
        description.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        description.textColor = .white
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        description.attributedText = attributedString
        return description
    }()
    let startButton: UIButton = {
        let start = UIButton()
        start.setTitle("List of countries", for: .normal)
        start.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        start.setTitleColor(.white, for: .normal)
        start.backgroundColor = .newSystemPink
        start.layer.cornerRadius = 10
        start.translatesAutoresizingMaskIntoConstraints = false
        start.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return start
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = onboardScreen.bgName
        illustration.image = UIImage(named: onboardScreen.iconName)
        headingTitle.text = onboardScreen.name
        details.text = onboardScreen.desc
        startButton.isHidden = true
    
        // Animation
        if onboardScreen.index == 0 {
            UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat,.autoreverse], animations: {
                self.illustration.center.y += 20
                
            }, completion: nil)
        }
        if onboardScreen.index == 2 {
            startButton.isHidden = false
        }
        
        view.addSubview(headingTitle)
        view.addSubview(details)
        view.addSubview(illustration)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            details.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            details.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            illustration.bottomAnchor.constraint(equalTo: details.topAnchor, constant: -70),
            illustration.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            illustration.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            illustration.heightAnchor.constraint(equalToConstant: 210),
            illustration.widthAnchor.constraint(equalToConstant: 200),
            
            headingTitle.bottomAnchor.constraint(equalTo: details.topAnchor, constant: -40),
            headingTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            headingTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            startButton.topAnchor.constraint(equalTo: details.bottomAnchor, constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 190),
        ])
    }
    
    @objc func tapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "navVC") as! UINavigationController
        self.view.window?.rootViewController = vc
        self.view.window?.makeKeyAndVisible()
    }
}

extension UIColor {
    static let offWhite = UIColor(red: 225/255, green: 225/255, blue: 235/255, alpha: 1.0)
    static let bluishPurple = UIColor(red: 0.33, green: 0.42, blue: 0.86, alpha: 1.0)
    static let newSystemPink = UIColor(red:1.00, green:0.42, blue:0.53, alpha:1.00)
    static let newSystemIndigo = UIColor(red:0.35, green:0.34, blue:0.84, alpha:0.80)
    static let newSystemOrange = UIColor(red:1.00, green:0.58, blue:0.00, alpha:0.80)
    static let alagPink = UIColor(red:1.00, green:0.45, blue:0.66, alpha:1.00)
}

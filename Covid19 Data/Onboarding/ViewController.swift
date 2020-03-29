//
//  ViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-25.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import EMTNeumorphicView

class ViewController: UIViewController {
    
    let buttonPlay: EMTNeumorphicButton = {
        let button = EMTNeumorphicButton(type: .custom)
        // https://icons8.com
        button.setImage(UIImage(named: "heart-outline")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        button.setImage(UIImage(named: "heart-filled")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .selected)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 26, left: 24, bottom: 22, right: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        button.neumorphicLayer?.cornerRadius = 22.5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.offWhite
        buttonPlay.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        view.addSubview(buttonPlay)
        
        NSLayoutConstraint.activate([
            buttonPlay.widthAnchor.constraint(equalToConstant: 80),
            buttonPlay.heightAnchor.constraint(equalToConstant: 80),
            buttonPlay.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            buttonPlay.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        ])
    }
    
    @objc func tapped(_ button: EMTNeumorphicButton) {
        // isSelected property changes neumorphicLayer?.depthType automatically
        button.isSelected = !button.isSelected
        performSegue(withIdentifier: "data", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = TableViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    

}

extension UIColor {
    static let offWhite = UIColor(red: 225/255, green: 225/255, blue: 235/255, alpha: 1.0)
}


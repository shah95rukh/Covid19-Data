//
//  OnboardingViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-29.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

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
            return "Coronavirus disease\n(COVID-19) is an infectious disease caused by a new virus.\nThe disease causes respiratory illness (like the flu) with symptoms such as a cough, fever, and in more severe cases, difficulty breathing."
        case .secondScreen:
            return "Coronavirus disease\nspreads primarily through contact with an infected person when they cough or sneeze. It also spreads when a person touches a surface or object that has the virus on it, then touches their eyes, nose, or mouth."
        case .thirdScreen:
            return "You can protect\nyourself by washing your hands frequently, avoiding touching your face, and avoiding close contact (1 meter or 3 feet) with people who are unwell."
        }
    }
    
    var iconName: String {
        switch self {
        case .firstScreen:
            return "virus"
        case .secondScreen:
            return "cough"
        case .thirdScreen:
            return "handwash"
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

class OnboardingViewController: UIViewController {
    
    private var pageController: UIPageViewController?
    private var screens: [Screens] = Screens.allCases
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.offWhite
        self.setupPageController()
    }
    
    private func setupPageController() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: self.view.frame.width,height: self.view.frame.height)
        
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        
        let initialVC = OnboardingScreens(with: screens[0])
        self.pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        self.pageController?.didMove(toParent: self)
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.screens.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentVC = viewController as? OnboardingScreens else { return nil }
        var index = currentVC.onboardScreen.index
        
        if index == 0 { return nil }
        index -= 1
        let vc: OnboardingScreens = OnboardingScreens(with: screens[index])
        
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let currentVC = viewController as? OnboardingScreens else { return nil }
        var index = currentVC.onboardScreen.index

        if index >= self.screens.count - 1 { return nil }
        index += 1
        let vc: OnboardingScreens = OnboardingScreens(with: screens[index])
        
        return vc
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate { }

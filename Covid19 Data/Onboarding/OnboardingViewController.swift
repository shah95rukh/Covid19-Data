//
//  OnboardingViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-03-29.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private var pageController: UIPageViewController?
    private var screens: [Screens] = Screens.allCases
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupPageController()
    }
    
    private func setupPageController() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageController?.dataSource = self
        self.pageController?.delegate = self
        
        self.pageController?.view.frame = CGRect(x: 0,y: 0,width: view.frame.width,height: view.frame.height)
        
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        
        let initialVC = OnboardingScreens(with: screens[0])
        //self.pageController?.view.backgroundColor = initialVC.view.backgroundColor
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

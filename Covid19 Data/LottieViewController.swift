//
//  LottieViewController.swift
//  Covid19 Data
//
//  Created by Syed Ahmed on 2020-04-12.
//  Copyright © 2020 Syed Ahmed. All rights reserved.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.center = view.center
        animationView.loopMode = .loop
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

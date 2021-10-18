//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by username on 18.10.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        authService = SceneDelegate.shared().authService
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}


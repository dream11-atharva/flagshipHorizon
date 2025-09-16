//
//  ViewController.swift
//  flagshipHorizon
//
//  Created by 210496608 on 09/16/2025.
//  Copyright (c) 2025 210496608. All rights reserved.
//

import UIKit
import flagshipHorizon

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWelcomeLabel()
    }
    
    private func setupWelcomeLabel() {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to Flagship Horizon"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        welcomeLabel.textColor = .black
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Test the SDK
        let result = FlagshipHorizon.shared.add(10, 5)
        let testLabel = UILabel()
        testLabel.text = "SDK Test: 10 + 5 = \(result)"
        testLabel.textAlignment = .center
        testLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        testLabel.textColor = .blue
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(testLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


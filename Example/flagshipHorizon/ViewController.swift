//
//  ViewController.swift
//  flagshipHorizon
//
//  Created by 210496608 on 09/16/2025.
//  Copyright (c) 2025 210496608. All rights reserved.
//

import UIKit
import flagshipHorizon
import OpenFeature

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOpenFeatureAndUI()
    }
    
    private func setupOpenFeatureAndUI() {
        let config = FlagshipHorizonConfig(apiKey: "test-api-key-123")
        FlagshipHorizon.shared.configure(with: config)
                    
        FlagshipHorizon.shared.testFlags()
        
        let provider = FlagshipHorizonProvider()
        
        OpenFeatureAPI.shared.setProvider(provider: provider)
        
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
        
        
        
        // Test OpenFeature Client with hardcoded flags
        let client = OpenFeatureAPI.shared.getClient()
        
        let newFeatureEnabled = client.getBooleanValue(key: "new_feature_enabled", defaultValue: false)
        
        let welcomeMessage = client.getStringValue(key: "welcome_message", defaultValue: "Default Welcome")
        
        let maxRetries = client.getIntegerValue(key: "max_retries", defaultValue: 1)
        
        let discountRate = client.getDoubleValue(key: "discount_rate", defaultValue: 0.0)
        
        let providerLabel = UILabel()
        providerLabel.text = "Flags: Feature=\(newFeatureEnabled), Retries=\(maxRetries), Discount=\(discountRate)"
        providerLabel.textAlignment = .center
        providerLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        providerLabel.textColor = .green
        providerLabel.numberOfLines = 0
        providerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabel = UILabel()
        messageLabel.text = "Message: \(welcomeMessage)"
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        messageLabel.textColor = .purple
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(testLabel)
        view.addSubview(providerLabel)
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            
            providerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            providerLabel.topAnchor.constraint(equalTo: testLabel.bottomAnchor, constant: 20),
            providerLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            providerLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: providerLabel.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//
//  VerificationViewController.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/26.
//

import UIKit

class VerificationViewController: UIViewController {

    var coordinator: LoginFlow
    var viewModel: LoginViewModel
    
    init(coordinator: LoginFlow, viewModel: LoginViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }
    
}

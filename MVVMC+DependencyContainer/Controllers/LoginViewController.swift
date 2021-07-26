//
//  LoginViewController.swift
//  MVVMC+DependencyContainer
//
//  Created by 沈維庭 on 2021/7/25.
//

import UIKit

class LoginViewController: UIViewController {

    var coordinator: LoginFlow
    var viewModel: LoginViewModel
    
    init(coordinator: LoginFlow,
         viewModel: LoginViewModel = LoginViewModel()) {
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
        view.backgroundColor = .red
        setUI()
    }
    
    func setUI() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        button.backgroundColor = .blue
        button.setTitle("登入", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginBtnPressed(_:)), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc func loginBtnPressed(_ sender: UIButton) {
        viewModel.login(acc: "", pwd: "")
        coordinator.loginSuccess()
    }
}

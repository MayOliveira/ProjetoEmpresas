//
//  LoginViewController.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 03/04/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        let savedArray = defaults.object(forKey: "uid")
        print("\n\n#Default")
        print(savedArray as Any)
    }

    override func loadView() {
        view = LoginView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
}

//
//  LoginViewController.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 03/04/21.
//

import UIKit

class LoginViewController: UIViewController, CustomTeller {
    
    private lazy var networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginView = LoginView()
        loginView.delegate = self
        view = loginView
    }

    override func loadView() {
        view = LoginView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    func signInButtonClicked(_: UIButton) {

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchViewController = storyBoard
                .instantiateViewController(withIdentifier: "SearchViewController")
                as? SearchViewController else { return }
        searchViewController.modalPresentationStyle = .fullScreen
        
        self.present(searchViewController, animated: true, completion: nil)
    }
}

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
        // Do any additional setup after loading the view.
        
        let values = Companies(email: "testeapple@ioasys.com.br", password: "12341234")
        
        networking.placeOrder(order: values)
    }

    override func loadView() {
        view = LoginView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
}

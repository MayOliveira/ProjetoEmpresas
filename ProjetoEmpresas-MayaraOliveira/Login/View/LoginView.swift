//
//  LoginView.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 03/04/21.
//

import UIKit

class LoginView: UIView {
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = .backgroundHome
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var headerStackView: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.spacing = 16
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerStackView
    }()
    
    private lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = .logoHome
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Seja bem vindo ao Empresas!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.systemFont(ofSize: 20)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        self.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(backgroundImage)
        self.backgroundImage.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(logoImage)
        self.headerStackView.addArrangedSubview(welcomeLabel)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupBackgroundImageConstraints()
        setupHeaderStackViewConstraints()
    }
    
    func setupBackgroundImageConstraints() {
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                multiplier: 1.0/3.0).isActive = true
    }
    
    func setupHeaderStackViewConstraints() {
        headerStackView.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -20).isActive = true
        headerStackView.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 20).isActive = true
        headerStackView.centerYAnchor.constraint(equalTo: self.backgroundImage.centerYAnchor).isActive = true
    }
}

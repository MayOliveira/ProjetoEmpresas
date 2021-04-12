//
//  SearchView.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 12/04/21.
//

import UIKit

class SearchView: UIView {
    
    private lazy var networking = Networking()
    
    // Header
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = .searchBackground
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .graySecondary
        searchView.layer.cornerRadius = 4
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    
    private lazy var searchIcon: UIImageView = {
        let searchIcon = UIImageView()
        searchIcon.image = .searchIcon
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        return searchIcon
    }()
    
    private lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        searchTextField.keyboardType = .default
        searchTextField.autocorrectionType = .no
        searchTextField.textColor = .grayText
        searchTextField.tintColor = .pinkMain
        searchTextField.placeholder = "Pesquise por empresa"
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return searchTextField
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        self.setBackgroundColor(to: .white)
        addSubviews()
        setupConstraints()
        
        searchTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(backgroundImage)
        self.addSubview(searchView)
        self.searchView.addSubview(searchIcon)
        self.searchView.addSubview(searchTextField)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupBackgroundImageConstraints()
        setupSearchViewConstraints()
        setupSearchIconConstraints()
        setupSearchTextFieldConstraints()
    }
    
    // Header
    func setupBackgroundImageConstraints() {
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                multiplier: 1.0/3.5).isActive = true
    }
    
    func setupSearchViewConstraints() {
        searchView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
            .isActive = true
        searchView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
            .isActive = true
        searchView.topAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -24)
            .isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupSearchIconConstraints() {
        searchIcon.leftAnchor.constraint(equalTo: self.searchView.leftAnchor, constant: 16)
            .isActive = true
        searchIcon.topAnchor.constraint(equalTo: self.searchView.topAnchor, constant: 14)
            .isActive = true
        searchIcon.bottomAnchor.constraint(equalTo: self.searchView.bottomAnchor, constant: -14)
            .isActive = true
    }
    
    func setupSearchTextFieldConstraints() {
        searchTextField.rightAnchor.constraint(equalTo: self.searchView.rightAnchor, constant: -12).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.searchIcon.rightAnchor, constant: 15).isActive = true
        searchTextField.topAnchor.constraint(equalTo: self.searchView.topAnchor, constant: 5).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: self.searchView.bottomAnchor, constant: -5).isActive = true
    }
}

// MARK: TextField
extension SearchView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        networking.searchEnterprise(text: Search(enterpriseSearched: text)) { (enterprises, error) in
          
            if let error = error { print(error) }
            guard let enterprises = enterprises?.enterprises else { return }
            if enterprises.isEmpty { print("Nenhum resultado encontrado") }
            
            // reload data
        }
    }
}

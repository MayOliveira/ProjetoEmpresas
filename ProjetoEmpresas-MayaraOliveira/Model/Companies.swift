//
//  Companies.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 10/04/21.
//

import Foundation

struct Companies: Codable {
    var email: String
    var password: String
}

struct User: Decodable {
    var investor: Investor
    var enterprise: String?
    var success: Bool
}

struct Investor: Decodable {
    var id: Int
    var investor_name: String
    var email: String
    var city: String
    var country: String
    var balance: Double
    var photo: String?
    var portfolio: Portfolio
    
    var portfolio_value: Double
    var first_access: Bool
    var super_angel: Bool
}

struct Portfolio: Decodable {
    var enterprises_number: Int
    var enterprises: [String]
}

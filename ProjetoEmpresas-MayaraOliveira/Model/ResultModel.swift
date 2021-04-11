//
//  ResultModel.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 10/04/21.
//

import Foundation

struct ResultModel<T: Decodable>: Decodable {
    var investor: T?
    var enterprise: String?
    var success: Bool
    
    enum CodingKeys: String, CodingKey {
        case investor
        case enterprise
        case success
    }
}

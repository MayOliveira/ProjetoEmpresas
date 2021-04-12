//
//  EnterpriseDetailViewController.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 12/04/21.
//

import UIKit

class EnterpriseDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = EnterpriseDetailView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

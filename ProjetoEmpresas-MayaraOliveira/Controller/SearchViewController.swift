//
//  SearchViewController.swift
//  ProjetoEmpresas-MayaraOliveira
//
//  Created by Mayara Ferreira de Oliveira on 12/04/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var networking = Networking()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networking.searchEnterprise(text: Search(enterpriseSearched: "z")) { (enterprises, error) in
            print("AQUI")
            print(enterprises?.enterprises.count as Any)
        }
    }
    
    override func loadView() {
        view = SearchView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

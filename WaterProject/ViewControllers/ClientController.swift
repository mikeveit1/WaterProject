//
//  ViewController.swift
//  WaterProject
//
//  Created by Michael Veit on 10/1/21.
//

import UIKit
import Foundation

class ClientController: UIViewController {
    @IBOutlet weak var clientTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureClientTable()
    }
    
    private func configureClientTable() {
        clientTable.dataSource = self
        clientTable.delegate = self
        clientTable.backgroundColor = .white
        clientTable.rowHeight = UITableView.automaticDimension
    }
}

extension ClientController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        
        return cell
    }
    
    
}

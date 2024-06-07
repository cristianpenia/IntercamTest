//
//  ShowListShowListViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit
import SnapKit

class ShowListViewController: UIViewController {

    
    // MARK: Views
    
    var contentTableView: UITableView! {
        didSet {
            contentTableView.dataSource = self
            contentTableView.delegate = self
            contentTableView.separatorStyle = .none
            contentTableView.keyboardDismissMode = .onDrag
            contentTableView.showsVerticalScrollIndicator = false
            contentTableView.allowsMultipleSelection = false
            contentTableView.backgroundColor = .clear
            
            contentTableView.register(AirportInformationTableViewCell.self, forCellReuseIdentifier: "AirportInformationTableViewCell")
        }
    }
    
    
    // MARK: Properties
    
    var output: ShowListViewOutput!
    var airports: [Airport] = [] 
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        output.viewIsReady()
    }
    
    private func setupView() {
        
        navigationController?.title = "Aeropuertos"
        
        contentTableView = UITableView()
        
        view.addSubview(contentTableView)
        
        contentTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: ShowListViewInput

extension ShowListViewController: ShowListViewInput {
    func setupInitialState(airports: [Airport]) {
        self.airports = airports
    }
    
    func modelInput() -> ShowListModuleInput {
        return output as! ShowListModuleInput
    }
}

extension ShowListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "AirportInformationTableViewCell", for: indexPath) as! AirportInformationTableViewCell
        
        cell.customization(with: airports[indexPath.row])
        
        return cell
    }
    
}

extension ShowListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

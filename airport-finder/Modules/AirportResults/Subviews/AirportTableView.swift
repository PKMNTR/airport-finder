//
//  AirportTableView.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import UIKit

class AirportTableView: UIViewController {
    
    var airports = [Airport]()
    
    let table: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        return table
    }()
    
    override func loadView() {
        super.loadView()
        setupUI()
        activateConstraints()
        setupTable()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(table)
    }
    
    func activateConstraints() {
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTable() {
        table.register(AirportCell.self, forCellReuseIdentifier: AirportCell.cellIdentifier)
        table.dataSource = self
    }
    
    func updateTable(withAirports airports: [Airport]) {
        self.airports = airports
        table.reloadData()
    }
    
}

extension AirportTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AirportCell.cellIdentifier, for: indexPath) as! AirportCell
        cell.updateUI(withAirport: airports[indexPath.row])
        return cell
    }
    
    
}

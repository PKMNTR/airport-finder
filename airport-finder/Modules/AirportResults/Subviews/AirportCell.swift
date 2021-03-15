//
//  AirportCell.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 15/03/21.
//

import UIKit

class AirportCell: UITableViewCell {
    
    static let cellIdentifier = "airportCell"
    
    let mainContainer = UIView()
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let municipalityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        activateConstraints()
    }
    
    func setupUI() {
        selectionStyle = .none
        contentView.addSubview(mainContainer)
        mainContainer.addSubview(mainStack)
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(municipalityLabel)
    }
    
    func activateConstraints() {
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
        ])
    }
    
    func updateUI(withAirport airport: Airport) {
        nameLabel.text = airport.name
        municipalityLabel.text = airport.municipalityName
    }
    
    
}

//
//  AirportInformationTableViewCell.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 06/06/24.
//

import UIKit
import SnapKit

class AirportInformationTableViewCell: UITableViewCell {
    
    
    // MARK: Views
    
    private var planeImageView: UIImageView! {
        didSet {
            planeImageView.contentMode = .scaleAspectFill
            planeImageView.clipsToBounds = true
            planeImageView.image = UIImage(systemName: "airplane.departure")
        }
    }
    
    private var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }

    private var codeLabel: UILabel! {
        didSet {
            codeLabel.numberOfLines = 1
            codeLabel.font = UIFont.systemFont(ofSize: 13)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupView()
    }
    
    private func setupView() {
        
        backgroundColor = .white
        
        planeImageView = UIImageView()
        
        addSubview(planeImageView)
        
        planeImageView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        
        nameLabel = UILabel()
        
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(planeImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(16)
        }
        
        codeLabel = UILabel()
        
        addSubview(codeLabel)
        
        codeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(planeImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    public func customization(with airport: Airport) {
        nameLabel.text = airport.name
        codeLabel.text = "Código ICAO: \(airport.icaoCode)"
    }

    override func prepareForReuse() {
        nameLabel.text = ""
    }
}

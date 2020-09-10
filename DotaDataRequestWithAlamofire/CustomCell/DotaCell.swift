//
//  DotaCell.swift
//  DotaDataRequestWithAlamofire
//
//  Created by Catalina on 9.09.2020.
//  Copyright © 2020 Catalina. All rights reserved.
//

import UIKit
import TinyConstraints

class DotaCell: UITableViewCell {

    public static var identifier = "DotaCell"
    
     lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
     lazy var attackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(stackView)
        stackView.edgesToSuperview(insets: UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20))
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(attackLabel)
    }
    
     func set(with viewModel: DotaCellProtocol) {
        title.text = viewModel.title
        attackLabel.text = viewModel.attackType
    }
}

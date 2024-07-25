//
//  CustomPageControlCollectionViewCell.swift
//  CustomPageCtrl
//
//  Created by seobyeonggwan on 2024/07/25.
//

import UIKit

class CustomPageControlCollectionViewCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.8),
            label.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor, multiplier: 0.8)
        ])
    }
    
    func configure(with text: String, background backgroundColor: UIColor) {
        label.text = text
        contentView.backgroundColor = backgroundColor
    }
}

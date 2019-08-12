//
//  MyCollectionViewCell.swift
//  CellInception
//
//  Created by Daniel Munoz on 10.08.19.
//  Copyright © 2019 Daniel Munoz. All rights reserved.
//

import UIKit

/// CollectionViewCell with just a square UIView
final class MyCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let squareView = UIView()
        squareView.backgroundColor = .yellow
        [squareView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        let constraint = squareView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        constraint.priority = .defaultHigh
        
        let constraintTop = squareView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        constraintTop.priority = .defaultHigh
        NSLayoutConstraint.activate([
            squareView.heightAnchor.constraint(equalToConstant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            constraint,
            constraintTop,
            squareView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            squareView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            ])
        self.setNeedsLayout()
    }
}

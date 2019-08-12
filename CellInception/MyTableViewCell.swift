//
//  MyTableViewCell.swift
//  CellInception
//
//  Created by Daniel Munoz on 10.08.19.
//  Copyright © 2019 Daniel Munoz. All rights reserved.
//

import UIKit

/// TableViewCell that contains a UICollectionView
final class MyTableViewCell: UITableViewCell {
    
    var heightConstraint: NSLayoutConstraint?
    
    private lazy var collectionView: UICollectionView = {
        let alignedFlowLayout = UICollectionViewFlowLayout()
        alignedFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [self.collectionView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        }
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        topConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            topConstraint,
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            ])
    }
    
    // On a real implementation, the update method would be called during cellForRowAtIndexPath and pass
    // data to populate the contents of this cell, during this time *maybe* we could calculate the correct height
    // and change the `heightConstraint.constant` to this value
    func update() {
        self.contentView.layoutIfNeeded()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 500)
        self.collectionView.layoutIfNeeded()
        return self.collectionView.collectionViewLayout.collectionViewContentSize
    }

}

extension MyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}

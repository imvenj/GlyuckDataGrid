//
//  DataGridViewColumnHeaderCell.swift
//
//  Created by Vladimir Lyukov on 03/08/15.
//

import UIKit


open class DataGridViewColumnHeaderCell: DataGridViewBaseHeaderCell {
    private static var __once: () = {
        let appearance = DataGridViewColumnHeaderCell.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.sortedBackgroundColor = UIColor(white: 220.0/255.0, alpha: 1)
        appearance.sortAscSuffix = " ↑"
        appearance.sortDescSuffix = " ↓"
        appearance.textLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        appearance.borderBottomColor = UIColor(white: 0.73, alpha: 1)
        appearance.borderBottomWidth = 1 / UIScreen.main.scale
        
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf: [DataGridViewColumnHeaderCell.self])
        labelAppearance.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        labelAppearance.textAlignment = .center
        labelAppearance.adjustsFontSizeToFitWidth = true
        labelAppearance.minimumScaleFactor = 0.5
        labelAppearance.numberOfLines = 0
        
    }()
    // MARK: - UIView
    @objc public override init(frame: CGRect) {
        super.init(frame: frame)
        _ = DataGridViewColumnHeaderCell.__once
    }

    @objc public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _ = DataGridViewColumnHeaderCell.__once
    }

    // MARK: - Custom methods
    
    @objc open override func didTap(_ gesture: UITapGestureRecognizer) {
        dataGridView.collectionViewDelegate.collectionView(dataGridView.collectionView, didTapHeaderForColumn: indexPath.index)
    }
}

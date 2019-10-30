//
//  DataGridViewRowHeaderCell.swift
//  Pods
//
//  Created by Vladimir Lyukov on 20/11/15.
//
//

import UIKit


open class DataGridViewRowHeaderCell: DataGridViewBaseHeaderCell {
    static let __once: () = {
        let appearance = DataGridViewRowHeaderCell.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.sortedBackgroundColor = UIColor(white: 220.0/255.0, alpha: 1)
        appearance.sortAscSuffix = " →"
        appearance.sortDescSuffix = " ←"
        appearance.textLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        appearance.borderRightColor = UIColor(white: 0.73, alpha: 1)
        appearance.borderRightWidth = 1 / UIScreen.main.scale
        
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf: [DataGridViewRowHeaderCell.self])
        labelAppearance.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        labelAppearance.adjustsFontSizeToFitWidth = true
        labelAppearance.minimumScaleFactor = 0.5
        labelAppearance.numberOfLines = 0
        
    }()

    @objc public override init(frame: CGRect) {
        super.init(frame: frame)
        _ = DataGridViewRowHeaderCell.__once
    }

    @objc public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _ = DataGridViewRowHeaderCell.__once
    }

    @objc override open func didTap(_ gesture: UITapGestureRecognizer) {
    }
}

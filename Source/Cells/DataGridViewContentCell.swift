//
//  DataGridViewContentCell.swift
//
//  Created by Vladimir Lyukov on 03/08/15.
//

import UIKit


/**
 Class for default data grid view cell.
 */
open class DataGridViewContentCell: DataGridViewBaseCell {
    private static let __once: () = {
        let appearance = DataGridViewContentCell.appearance()
        appearance.textLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf: [DataGridViewContentCell.self])
        labelAppearance.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        labelAppearance.minimumScaleFactor = 0.5
        labelAppearance.numberOfLines = 0
    }()

    @objc public override init(frame: CGRect) {
        super.init(frame: frame)
        _ = DataGridViewContentCell.__once
    }

    @objc public required init?(coder: NSCoder) {
        super.init(coder: coder)
        _ = DataGridViewContentCell.__once
    }
}

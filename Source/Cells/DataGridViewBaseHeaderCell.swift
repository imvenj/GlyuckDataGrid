//
//  DataGridViewBaseHeaderCell.swift
//  Pods
//
//  Created by Vladimir Lyukov on 20/11/15.
//
//

//
//  DataGridViewColumnHeaderCell.swift
//
//  Created by Vladimir Lyukov on 03/08/15.
//

import UIKit


/// Base class for sortable and tapable headers
open class DataGridViewBaseHeaderCell: DataGridViewBaseCell {
    fileprivate var normalBackgroundColor: UIColor? {
        didSet {
            updateSortedTitleAndBackground()
        }
    }
    /// Background color for sorted state
    @objc open dynamic var sortedBackgroundColor: UIColor? {
        didSet {
            updateSortedTitleAndBackground()
        }
    }
    @objc open override dynamic var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            normalBackgroundColor = newValue
        }
    }
    /// This suffix will be appended to title if column/row is sorted in ascending order.
    @objc open dynamic var sortAscSuffix: String?
    /// This suffix will be appended to title if column/row is sorted in descending order.
    @objc open dynamic var sortDescSuffix: String?
    /// Header title. Use this property instead of assigning to textLabel.text.
    @objc open var title: String = "" {
        didSet {
            updateSortedTitleAndBackground()
        }
    }
    /// Is this header in sorted state (i.e. has sortedBackgroundColor and sortAscSuffix/sortDescSuffix applied)
    @objc open var isSorted: Bool = false {
        didSet {
            updateSortedTitleAndBackground()
        }
    }
    /// Is this header in sorted ascending or descending order? Only taken into account if isSorted == true.
    @objc open var isSortedAsc: Bool = true {
        didSet {
            updateSortedTitleAndBackground()
        }
    }
    @objc open var dataGridView: DataGridView!
    @objc open var indexPath: IndexPath!

    // MARK: - UIView

    @objc public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDataGridViewHeaderCell()
    }

    @objc public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDataGridViewHeaderCell()
    }

    // MARK: - Custom methods

    @objc open func updateSortedTitleAndBackground() {
        if isSorted {
            textLabel.text = title + ((isSortedAsc ? sortAscSuffix : sortDescSuffix) ?? "")
            super.backgroundColor = sortedBackgroundColor
        } else {
            textLabel.text = title
            super.backgroundColor = normalBackgroundColor
        }
    }

    @objc open func setupDataGridViewHeaderCell() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DataGridViewBaseHeaderCell.didTap(_:)))
        contentView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc open func configureForDataGridView(_ dataGridView: DataGridView, indexPath: IndexPath) {
        self.dataGridView = dataGridView
        self.indexPath = indexPath
    }

    @objc open func didTap(_ gesture: UITapGestureRecognizer) {
        dataGridView.collectionViewDelegate.collectionView(dataGridView.collectionView, didTapHeaderForColumn: indexPath.index)
    }
}

//
//  MultiplicationTableViewController.swift
//  GlyuckDataGrid
//
//  Created by Vladimir Lyukov on 19/11/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import GlyuckDataGrid


class MultiplicationTableViewController: UIViewController, DataGridViewDataSource, DataGridViewDelegate {
    @IBOutlet weak var dataGridView: DataGridView!

    func setupView() {
        let dataGridAppearance = DataGridView.appearance(whenContainedInInstancesOf: [MultiplicationTableViewController.self])
        dataGridAppearance.row1BackgroundColor = nil
        dataGridAppearance.row2BackgroundColor = nil

        let cornerHeaderAppearance = DataGridViewCornerHeaderCell.appearance(whenContainedInInstancesOf: [MultiplicationTableViewController.self])
        cornerHeaderAppearance.backgroundColor = UIColor.white
        cornerHeaderAppearance.borderBottomWidth = 1 / UIScreen.main.scale
        cornerHeaderAppearance.borderBottomColor = UIColor(white: 0.73, alpha: 1)
        cornerHeaderAppearance.borderRightWidth = 1 / UIScreen.main.scale
        cornerHeaderAppearance.borderRightColor = UIColor(white: 0.73, alpha: 1)

        let rowHeaderAppearance = DataGridViewRowHeaderCell.appearance(whenContainedInInstancesOf: [MultiplicationTableViewController.self])
        rowHeaderAppearance.backgroundColor = UIColor(white: 0.95, alpha: 1)
        rowHeaderAppearance.borderBottomWidth = 1 / UIScreen.main.scale
        rowHeaderAppearance.borderBottomColor = UIColor(white: 0.73, alpha: 1)

        let columnHeaderAppearance = DataGridViewColumnHeaderCell.appearance(whenContainedInInstancesOf: [MultiplicationTableViewController.self])
        columnHeaderAppearance.borderRightWidth = 1 / UIScreen.main.scale
        columnHeaderAppearance.borderRightColor = UIColor(white: 0.73, alpha: 1)

        let cellAppearance = DataGridViewContentCell.appearance(whenContainedInInstancesOf: [MultiplicationTableViewController.self])
        cellAppearance.borderRightWidth = 1 / UIScreen.main.scale
        cellAppearance.borderRightColor = UIColor(white: 0.73, alpha: 1)
        cellAppearance.borderBottomWidth = 1 / UIScreen.main.scale
        cellAppearance.borderBottomColor = UIColor(white: 0.73, alpha: 1)

        columnHeaderAppearance.backgroundColor = UIColor(white: 0.95, alpha: 1)
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf: [MultiplicationTableViewController.self])
        labelAppearance.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        labelAppearance.textAlignment = .center
    }

    override func viewDidLoad() {
        setupView()
        dataGridView.delegate = self
        dataGridView.dataSource = self

        dataGridView.rowHeaderWidth = 30
        dataGridView.columnHeaderHeight = 30
    }

    // MARK: - DataGridViewDataSource

    func numberOfRowsInDataGridView(_ dataGridView: DataGridView) -> Int {
        return 9
    }

    func numberOfColumnsInDataGridView(_ dataGridView: DataGridView) -> Int {
        return 9
    }

    func dataGridView(_ dataGridView: DataGridView, titleForHeaderForRow row: Int) -> String {
        return String(row + 1)
    }

    func dataGridView(_ dataGridView: DataGridView, titleForHeaderForColumn column: Int) -> String {
        return String(column + 1)
    }

    func dataGridView(_ dataGridView: DataGridView, textForCellAtIndexPath indexPath: IndexPath) -> String {
        return String( (indexPath.dataGridRow + 1) * (indexPath.dataGridColumn + 1) )
    }

    // MARK: - DataGridViewDelegate

    func dataGridView(_ dataGridView: DataGridView, shouldSelectRow row: Int) -> Bool {
        return false
    }

    func dataGridView(_ dataGridView: DataGridView, heightForRow row: Int) -> CGFloat {
        if let layout = dataGridView.collectionView.collectionViewLayout as? DataGridViewLayout {
            return layout.widthForColumn(row)
        }
        return 44
    }
}

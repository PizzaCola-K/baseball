//
//  PitchingHistoryDataSource.swift
//  baseball
//
//  Created by user on 2021/05/06.
//

import UIKit

class PitchingHistoryDataSource {

    private var dataSource: UITableViewDiffableDataSource<Int, PitchingHistory>!
    
    func setupDataSource(tableView: UITableView) -> Void {
        self.dataSource = UITableViewDiffableDataSource<Int, PitchingHistory>(tableView: tableView, cellProvider: { (tableView, indexPath, pitchingHistory) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "pitchingHistoryCell") as! HistoryTableViewCell
            cell.configureCell(history: pitchingHistory, indexPath: indexPath)
            return cell
        })
        var snapshot = self.dataSource.snapshot()
        snapshot.appendSections([1])
        self.dataSource.apply(snapshot)
    }
    
    func applySnapshot(pitchingHistory: [PitchingHistory]) {
        var snapshot = self.dataSource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([1])
        snapshot.appendItems(pitchingHistory)
//        let items = snapshot.itemIdentifiers(inSection: "1")
//        if items.count == 0 {
//            snapshot.appendItems([string], toSection: "1")
//        } else {
//            snapshot.insertItems([string], beforeItem: items[0])
//        }
        
        self.dataSource.apply(snapshot)
    }
}

//
//  PlayerListDataSource.swift
//  baseball
//
//  Created by 박정하 on 2021/05/13.
//

import UIKit

class PlayerListDataSource {
    
    private var dataSource: UITableViewDiffableDataSource<Int, Player>!
    
    func setupDataSource(tableView: UITableView) -> Void {
        self.dataSource = UITableViewDiffableDataSource<Int, Player>(tableView: tableView, cellProvider: { (tableView, indexPath, player) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerInfo") as! playerInfoCell
            cell.LabelCollection[0].text = player.name
            cell.LabelCollection[1].text = "\(player.atBat)"
            cell.LabelCollection[2].text = "\(player.hits)"
            cell.LabelCollection[3].text = "\(player.out)"
            cell.LabelCollection[4].text = String(format: "%.3f", player.average)
            return cell
        })
        var snapshot = self.dataSource.snapshot()
        snapshot.appendSections([0])
        self.dataSource.apply(snapshot)
    }
    
    func applySnapshot(players: Players) {
        var snapshot = self.dataSource.snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([0])
        snapshot.appendItems(players.players, toSection: 0)
        self.dataSource.apply(snapshot)
    }
}

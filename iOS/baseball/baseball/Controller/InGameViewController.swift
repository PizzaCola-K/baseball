//
//  InGameViewController.swift
//  baseball
//
//  Created by 박정하 on 2021/05/04.
//

import UIKit

class InGameViewController: UIViewController {
    
    @IBOutlet weak var pitchingHistoryTableView: UITableView!
    @IBOutlet weak var inningInfoView: InningInfoView!
    @IBOutlet weak var fieldView: FieldView!
    
    private var dataSource = PitchingHistoryDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.setupDataSource(tableView: pitchingHistoryTableView)
        self.inningInfoView.applyBallCount(strike: 2, ball: 2, out: 1)
        self.inningInfoView.applyBallCount(strike: 0, ball: 0, out: 2)
    }
}


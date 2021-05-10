//
//  ScoreViewController.swift
//  baseball
//
//  Created by 박정하 on 2021/05/04.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var homeScore: UIStackView!
    @IBOutlet weak var awayScore: UIStackView!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var playersScoreTableView: UITableView!
    
    private var tempInt: Int = 0 //뷰가 추가되는 효과를 보기 위한 임시 변수
    private let scoreTableViewdelegate: ScoreTableViewDelegate
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.scoreTableViewdelegate = ScoreTableViewDelegate()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.scoreTableViewdelegate = ScoreTableViewDelegate()
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        self.playersScoreTableView.delegate = scoreTableViewdelegate
    }
    
    func isAttack(myTeam: MyTeam) -> Bool {
        return myTeam.Value == InningInfo().attackTeam
    }
}

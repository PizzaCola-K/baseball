//
//  ScoreViewController.swift
//  baseball
//
//  Created by 박정하 on 2021/05/04.
//

import UIKit

protocol ScoreViewControllerManageable {
    func initScoreModel(with: JSONRequestDTO)
}

class ScoreViewController: UIViewController, ScoreViewControllerManageable {
    
    @IBOutlet weak var homeScore: UIStackView!
    @IBOutlet weak var awayScore: UIStackView!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var playersScoreTableView: UITableView!
    
    private let scoreTableViewdelegate: ScoreTableViewDelegate
    private let scoreModel: ScoreModel
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.scoreModel = ScoreModel()
        self.scoreTableViewdelegate = ScoreTableViewDelegate()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.scoreModel = ScoreModel()
        self.scoreTableViewdelegate = ScoreTableViewDelegate()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playersScoreTableView.delegate = scoreTableViewdelegate
    }
    
    override func loadView() {
        super.loadView()
    }
    
    @IBAction func testadd(_ sender: Any) { //공수교대가 일어날 경우 노란뷰가 추가되는 것을 보기 위한 임시 버튼 액션 함수
        self.addLabel(title: "0", ishome: true)
    }
    
    func addLabel(title: String, ishome: Bool) {
        let tempLabel: UILabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        if ishome {
            homeScore.addArrangedSubview(tempLabel)
            tempLabel.widthAnchor.constraint(equalTo: customLabel.widthAnchor, multiplier: 1).isActive = true
            tempLabel.heightAnchor.constraint(equalTo: tempLabel.widthAnchor, multiplier: 1).isActive = true
            tempLabel.backgroundColor = .yellow
        }
    }
    
    func initScoreModel(with data: JSONRequestDTO) {
        self.scoreModel.updateScoreModel(home: data.game.home, away: data.game.away, inningScore: data.game.inningScore, attackTeam: data.game.state)
    }
}

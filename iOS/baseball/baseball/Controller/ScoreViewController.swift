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
    @IBOutlet weak var teamSegmentControl: UISegmentedControl!
    @IBOutlet weak var teamScoreView: TeamScoreView!
    
    private let scoreTableViewdelegate: ScoreTableViewDelegate
    private let playerListDataSource: PlayerListDataSource
    private let scoreModel: ScoreModel
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.scoreModel = ScoreModel()
        self.scoreTableViewdelegate = ScoreTableViewDelegate()
        self.playerListDataSource = PlayerListDataSource()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.scoreModel = ScoreModel()
        self.scoreTableViewdelegate = ScoreTableViewDelegate()
        self.playerListDataSource = PlayerListDataSource()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playersScoreTableView.isUserInteractionEnabled = false
        self.playerListDataSource.setupDataSource(tableView: playersScoreTableView)
        self.playersScoreTableView.delegate = scoreTableViewdelegate
        self.playerListDataSource.applySnapshot(players: scoreModel.Away.players)
        self.teamSegmentControl.addTarget(self, action: #selector(tableViewSnapShot), for: .valueChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(updateScoreViews), name: ScoreModel.updatescoreModel, object: scoreModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.teamScoreView.applyTeamScore(homeName: self.scoreModel.Home.name, homeScore: self.scoreModel.Home.score, awayName: self.scoreModel.Away.name, awayScore: self.scoreModel.Away.score)
        ScoreViewSetup()
    }
    
    func initScoreModel(with data: JSONRequestDTO) {
        self.scoreModel.updateScoreModel(home: data.game.home, away: data.game.away, inningScore: data.game.inningScore, attackTeam: data.game.state)
    }
    
    @objc func tableViewSnapShot(){
        if self.teamSegmentControl.selectedSegmentIndex == 0 {
            self.playerListDataSource.applySnapshot(players: scoreModel.Away.players)
        }
        else {
            self.playerListDataSource.applySnapshot(players: scoreModel.Home.players)
        }
    }
    
    private func ScoreViewSetup() {
        while self.homeScore.subviews.count != self.scoreModel.inningScore.home.count {
            let tempLabel: UILabel = UILabel()
            tempLabel.translatesAutoresizingMaskIntoConstraints = false
            homeScore.addArrangedSubview(tempLabel)
            tempLabel.textAlignment = .center
            tempLabel.widthAnchor.constraint(equalTo: customLabel.widthAnchor, multiplier: 1).isActive = true
            tempLabel.heightAnchor.constraint(equalTo: tempLabel.widthAnchor, multiplier: 1).isActive = true
        }
        while self.awayScore.subviews.count != self.scoreModel.inningScore.away.count {
            let tempLabel: UILabel = UILabel()
            tempLabel.translatesAutoresizingMaskIntoConstraints = false
            awayScore.addArrangedSubview(tempLabel)
            tempLabel.textAlignment = .center
            tempLabel.widthAnchor.constraint(equalTo: customLabel.widthAnchor, multiplier: 1).isActive = true
            tempLabel.heightAnchor.constraint(equalTo: tempLabel.widthAnchor, multiplier: 1).isActive = true
        }
        updateScoreViews()
    }
    
    @objc func updateScoreViews() {
        DispatchQueue.main.async {
            for i in 0..<self.homeScore.subviews.count {
                guard let scoreLabel = self.homeScore.subviews[i] as? UILabel else { return }
                scoreLabel.text = String(self.scoreModel.inningScore.home[i])
            }
            for i in 0..<self.awayScore.subviews.count {
                guard let scoreLabel = self.awayScore.subviews[i] as? UILabel else { return }
                scoreLabel.text = String(self.scoreModel.inningScore.away[i])
            }
        }
    }
}

extension ScoreModel {
    static let updatescoreModel = Notification.Name("updatescoreModel")
}

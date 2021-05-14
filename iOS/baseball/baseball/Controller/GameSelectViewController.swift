//
//  ViewController.swift
//  baseball
//
//  Created by 박정하 on 2021/05/03.
//

import UIKit
//import OctoKit
import AuthenticationServices
import AVFoundation

class GameSelectViewController: UIViewController, GameSelectViewControllerManageable {
  
    @IBOutlet weak var gameListStackView: UIStackView!
    @IBOutlet weak var matchupCell: MatchUpCell!
    private var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    private var gameList: [MatchUpCell] = []

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.matchupCell.set(delegate: self)
//        playOpacityAnimation().
//        playMoveAnimation()
        SoundManager.playermp3Audio(audioPlayer: &audioPlayer, title: "yells")
        print("===========",requestGameList())
    }
    
    // 질문하기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let tabBarViewController = segue.destination as? UITabBarController,
              let tabbarFirstViewController = tabBarViewController.viewControllers?[0] as? InGameViewController else {
            return
        }
        guard let selectedTeamInfo = sender as? MyTeam else {
            return
        }
        tabbarFirstViewController.decide(team: selectedTeamInfo)
        audioPlayer.stop()
    }
    
    func moveToTeamSelectView() {
        let teamSelectView = Bundle.main.loadNibNamed("TeamSelectView", owner: self, options: nil)?.first as! TeamSelectView
        teamSelectView.frame = self.view.frame
        self.view.addSubview(teamSelectView)
        dismissTeamSelectView(view: teamSelectView)
        decideTeam(view: teamSelectView)
    }
    
    func decideTeam(view: TeamSelectView) {
        view.pressedTeam { (myTeam) -> (Void) in
            self.performSegue(withIdentifier: "toInGame", sender: myTeam)
        }
    }
    
    private func requestGameList() {
        NetworkManager.getGamelistRequest(needs: GameListModel.self) { (result) in
            switch result {
            case .success(let data):
                self.makeGameListView(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func dismissTeamSelectView(view: TeamSelectView) {
        view.pressedCancel { (bool) -> (Void) in
            if bool {
                DispatchQueue.main.async {
                    UIView.transition(with: view.cardView, duration: 0.8, options: .transitionCurlUp, animations: nil) { (_) in
                        view.removeFromSuperview()
                    }
                    view.cardView.alpha = 0
                }
            }
        }
    }
    
    func makeGameListView(data: GameListModel) {
        matchupCell.updateCellLabel(homeTeam: data.games[0].home, awayTeam: data.games[0].away, gameNumber: "Game \(data.games[0].gameId)")
        DispatchQueue.main.async {
            let imageView = UIImageView(image: UIImage(named: "versusbaseball"))
            imageView.contentMode = .scaleToFill
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            imageView.frame = self.matchupCell.frame
            self.matchupCell.insertSubview(imageView, at: 0)
        }
        for i in 1..<data.games.count {
            DispatchQueue.main.async {
                let gameView: MatchUpCell = MatchUpCell.init()
                gameView.set(delegate: self)
                gameView.backgroundColor = .systemGray4
                gameView.layer.cornerRadius = 10
                gameView.layer.masksToBounds = true
                gameView.alpha = 0.7
                let imageView = UIImageView(image: UIImage(named: "versusbaseball"))
                imageView.layer.cornerRadius = 10
                imageView.layer.masksToBounds = true
                imageView.frame = self.matchupCell.frame
                imageView.contentMode = .scaleToFill
                gameView.addSubview(imageView)
                let homelabel = self.makeLabel(title: data.games[i].home, size: 18)
                let awaylabel = self.makeLabel(title: data.games[i].away, size: 18)
                let gameidlabel = self.makeLabel(title: "Game \(data.games[i].gameId)", size: 14)
                let vsLabel = self.makeLabel(title: "vs", size: 50)
                gameView.addSubview(awaylabel)
                gameView.addSubview(homelabel)
                gameView.addSubview(gameidlabel)
                gameView.addSubview(vsLabel)
                gameidlabel.translatesAutoresizingMaskIntoConstraints = false
                gameidlabel.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
                gameidlabel.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 10).isActive = true
                gameidlabel.textColor = .systemRed
                vsLabel.translatesAutoresizingMaskIntoConstraints = false
                vsLabel.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
                vsLabel.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
                homelabel.translatesAutoresizingMaskIntoConstraints = false
                homelabel.trailingAnchor.constraint(equalTo: vsLabel.leadingAnchor, constant: -30).isActive = true
                homelabel.centerYAnchor.constraint(equalTo: vsLabel.centerYAnchor).isActive = true
                awaylabel.translatesAutoresizingMaskIntoConstraints = false
                awaylabel.leadingAnchor.constraint(equalTo: vsLabel.trailingAnchor, constant: 30).isActive = true
                awaylabel.centerYAnchor.constraint(equalTo: vsLabel.centerYAnchor).isActive = true
                self.gameList.append(gameView)
                self.gameListStackView.addArrangedSubview(gameView)
            }
        }
    }
    
    private func makeLabel(title: String, size: CGFloat) -> UILabel {
        let tempLabel: UILabel = UILabel()
        tempLabel.text = title
        tempLabel.font = .boldSystemFont(ofSize: size)
        tempLabel.textColor = .black
        tempLabel.sizeToFit()
        tempLabel.textAlignment = .right
        return tempLabel
    }
    
    private func playOpacityAnimation() -> Void {
        let layerWidth = view.bounds.size.width / 4
        let myCalayer : CALayer = {
            let calayer = CALayer()
            calayer.bounds = CGRect(x: 0, y: 0, width: layerWidth, height: layerWidth)
            calayer.position = CGPoint(x: view.bounds.size.width / 2 , y: layerWidth)
            calayer.backgroundColor = UIColor.black.cgColor
            return calayer
        }()
        view.layer.addSublayer(myCalayer)
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.repeatCount = 10 //
        myCalayer.add(animation, forKey: "GoRed")
        myCalayer.opacity = 0
    }
    
    private func playMoveAnimation() -> Void {
        let layerWidth = view.bounds.size.width / 4
        let myCalayer : CALayer = {
            let calayer = CALayer()
            calayer.bounds = CGRect(x: 0, y: 0, width: layerWidth, height: layerWidth)
            calayer.position = CGPoint(x: view.bounds.size.width / 2 , y: layerWidth)
            calayer.backgroundColor = UIColor.black.cgColor
            return calayer
        }()
        view.layer.addSublayer(myCalayer)
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        animation.fromValue = myCalayer.position
        animation.toValue = CGPoint(x: myCalayer.position.x, y: view.bounds.size.height - view.bounds.size.width / 4)
        animation.duration = 1
        myCalayer.add(animation, forKey: "move down")
//        myCalayer.position = CGPoint(x: myCalayer.position.x, y: view.bounds.size.height - view.bounds.size.width / 4)
    }
}

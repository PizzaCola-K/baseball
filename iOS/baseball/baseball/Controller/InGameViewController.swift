import UIKit
import Lottie

class InGameViewController: UIViewController {
    
    @IBOutlet weak var pitchingHistoryTableView: UITableView!
    @IBOutlet weak var inningInfoView: InningInfoView!
    @IBOutlet weak var fieldView: FieldView!
    @IBOutlet weak var teamScoreView: TeamScoreView!
    @IBOutlet weak var playerInfoView: PlayerInfoView!
    @IBOutlet weak var pitchButton: UIButton!
    
    private var dataSource: PitchingHistoryDataSource
    private var delegate: ScoreViewControllerManageable!
    private var inGameModel: InGameModel
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.dataSource = PitchingHistoryDataSource()
        self.inGameModel = InGameModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.dataSource = PitchingHistoryDataSource()
        self.inGameModel = InGameModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.setupDataSource(tableView: pitchingHistoryTableView)
//        self.inningInfoView.applyBallCount(strike: 2, ball: 2, out: 1)
//        self.inningInfoView.applyBallCount(strike: 0, ball: 0, out: 2)
        let scoreViewController = self.tabBarController?.viewControllers![1] as! ScoreViewController
        self.delegate = scoreViewController
        NotificationCenter.default.addObserver(self, selector: #selector(updateViews(sender:)), name: InGameModel.updateInGameModel, object: inGameModel)
        requestNetwork()
    }
    
    func decide(team: MyTeam) {
        self.inGameModel.set(team: team)
    }
    
    let lottieAnimationView = AnimationView()
    
    let ballAnimation: AnimationView = {
        let animationView = AnimationView(name: "ball")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.tag = 100
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    @IBAction func Pitch(_ sender: Any) {
//        self.view.addSubview(strikeAnimation)
//
    }
    
    @IBAction func ball(_ sender: Any) {
        self.view.addSubview(ballAnimation)
        ballAnimation.play { [weak self] _ in
            self?.removeAnimationView()
        }
    }
    private func removeAnimationView() {
        if let tag = self.fieldView.viewWithTag(100) {
            tag.removeFromSuperview()
        }
    }
    
    private func requestNetwork() -> Void {
        NetworkManager.getRequest(needs: JSONRequestDTO.self) { (result) in
            switch result {
            case .success(let data):
                self.inGameModel.updateGame(data: data)
                self.delegate.initScoreModel(with: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func pressedPitch(_ sender: UIButton) {
        NetworkManager.postRequest(needs: JSONRequestDTO.self) { (result) in
            switch result {
            case .success(let data):
                self.inGameModel.updateGame(data: data)
                self.delegate.initScoreModel(with: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func updateViews(sender: Notification) {
        DispatchQueue.main.async {
            self.updateBallCountView()
            self.updateInningView()
            self.updateTeamScoreView()
            self.updatePlayerInfoView()
            self.updateHistoryTableView()
            self.playLottieAnimation()
        }
    }
    
    func updateBallCountView() {
        let strike = inGameModel.inningInfo.strike
        let ball = inGameModel.inningInfo.ball
        let out = inGameModel.inningInfo.out
        self.inningInfoView.applyBallCount(strike: strike, ball: ball, out: out)
    }
    
    func updateInningView() {
        let currentInning = self.inGameModel.currentInning()
        let currentState = self.inGameModel.myCurrentInningState()
        self.inningInfoView.applyCurrentInningInfo(inning: currentInning, myState: currentState)
    }
    
    func updateTeamScoreView() {
        let homeName = self.inGameModel.homeTeamInfo.name
        let homeScore = self.inGameModel.homeTeamInfo.score
        let awayName = self.inGameModel.awayTeamInfo.name
        let awayScore = self.inGameModel.awayTeamInfo.score
        self.teamScoreView.applyTeamScore(homeName: homeName, homeScore: homeScore, awayName: awayName, awayScore: awayScore)
    }
    
    func updatePlayerInfoView() {
        let pitcherName = self.inGameModel.pitcher.name
        let pitchingBall = "#\(self.inGameModel.pitcher.pitches)"
        let batterName = self.inGameModel.batter.name
        let batterGrade = self.inGameModel.currentBatterGrade()
        let myTurn = self.inGameModel.currentMyState()
        self.playerInfoView.applyPlayerInfo(pitcherName: pitcherName, pitchingBallCount: pitchingBall, batterName: batterName, batterGrade: batterGrade)
        self.playerInfoView.applyMyTurn(turn: myTurn)
    }
    
    func updateHistoryTableView() {
        let history = self.inGameModel.inningInfo.pitchingHistory
        self.dataSource.applySnapshot(pitchingHistory: history)
    }
    
    func playLottieAnimation() {
        if self.inGameModel.inningInfo.pitchingHistory.count == 0 {
            return
        }
        let pitch = self.inGameModel.inningInfo.pitchingHistory[0].pitch
        switch pitch {
        case PitchingHistory.Pitch.STRIKE.value:
            addAnimationView(string: "strike")
        case PitchingHistory.Pitch.BALL.value:
            addAnimationView(string: "ball")
        case PitchingHistory.Pitch.OUT.value:
            addAnimationView(string: "out")
        case PitchingHistory.Pitch.HIT.value:
            addAnimationView(string: "hit")
        case PitchingHistory.Pitch.FOUR_BALL.value:
            addAnimationView(string: "fourball")
        default:
            break
        }
    }
    
    private func addAnimationView(string: String) {
        self.lottieAnimationView.frame = CGRect(x: 0, y: 0, width: self.fieldView.frame.width, height: self.fieldView.frame.height)
        lottieAnimationView.animation = Animation.named(string)
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.tag = 100
        lottieAnimationView.animationSpeed = 1.3
        self.fieldView.addSubview(lottieAnimationView)
        self.pitchButton.isHidden = true
        lottieAnimationView.play { [weak self] _ in
            self?.removeAnimationView()
            self?.pitchButton.isHidden = false
        }
    }
}

import UIKit
import Lottie

class InGameViewController: UIViewController {
    
    @IBOutlet weak var pitchingHistoryTableView: UITableView!
    @IBOutlet weak var inningInfoView: InningInfoView!
    @IBOutlet weak var fieldView: FieldView!
    
    var str = ""
    
    private var dataSource: PitchingHistoryDataSource
    private var delegate: VCDelegate!
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
        self.inningInfoView.applyBallCount(strike: 2, ball: 2, out: 1)
        self.inningInfoView.applyBallCount(strike: 0, ball: 0, out: 2)
        let vc = tabBarController?.viewControllers![1] as! ScoreViewController
        self.delegate = vc
        NetworkManager.getRequest(needs: JSONRequestDTO.self) { (result) in
            print(result)
        }
        print("====================\(inGameModel.printt())")
    }
    
    func decide(team: MyTeam) {
        self.inGameModel.set(team: team)
    }
    
    let strikeAnimation: AnimationView = {
        let animationView = AnimationView(name: "strike")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.tag = 100
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    let ballAnimation: AnimationView = {
        let animationView = AnimationView(name: "ball")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.tag = 100
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    @IBAction func Pitch(_ sender: Any) {
        self.view.addSubview(strikeAnimation)
        strikeAnimation.play { [weak self] _ in
            self?.removeAnimationView()
        }
    }
    
    @IBAction func ball(_ sender: Any) {
        self.view.addSubview(ballAnimation)
        ballAnimation.play { [weak self] _ in
            self?.removeAnimationView()
        }
    }
    private func removeAnimationView() {
        if let tag = self.view.viewWithTag(100) {
            tag.removeFromSuperview()
        }
    }
    
    private func requestNetwork() -> Void {
        NetworkManager.getRequest(needs: JSONRequestDTO.self) { (result) in
            switch result {
            case .success(let data):
                print("썽꽁!")
            case .failure(let error):
                print(error)
            }
        }
    }
}


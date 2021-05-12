
import UIKit

class TeamSelectView: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var homeTeamButton: UIButton!
    @IBOutlet weak var awayTeamButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    private var cancelCompletion : ((Bool) -> (Void))? = { _ in }
    private var selectedTeamCompletion : ((MyTeam) -> (Void))? = { _ in }
    
    override func awakeFromNib() {
        self.cardView.layer.borderColor = UIColor.darkGray.cgColor
        self.cardView.alpha = 0
        DispatchQueue.main.async {
            UIView.transition(with: self.cardView, duration: 0.8, options: [.transitionCurlDown], animations: nil, completion: nil)
            self.cardView.alpha = 1
        }
    }
    
    @IBAction func pressedCancelButton(_ sender: Any) {
        if let cancelButtonCompletion = cancelCompletion {
            cancelButtonCompletion(true)
        }
        cancelCompletion = nil
    }
    
    @IBAction func pressedTeamButton(_ sender: UIButton) {
        if sender == homeTeamButton, let selectedTeamCompletion = selectedTeamCompletion {
            selectedTeamCompletion(.Home)
        } else if sender == awayTeamButton, let selectedTeamCompletion = selectedTeamCompletion {
            selectedTeamCompletion(.Away)
        }
        selectedTeamCompletion = nil
    }
    
    
    func pressedCancel(closure: @escaping ((Bool) -> (Void))) {
        self.cancelCompletion = closure
    }
    
    func pressedTeam(closure: @escaping ((MyTeam) -> (Void))) {
        self.selectedTeamCompletion = closure
    }
    
    deinit {
        print("deinit", #function)
    }
}


import UIKit

class TeamScoreView: UIView {
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    
    func applyTeamScore(homeName: String, homeScore: Int, awayName: String, awayScore: Int) {
        self.homeName.text = homeName
        self.homeScore.text = "\(homeScore)"
        self.awayName.text = awayName
        self.awayScore.text = "\(awayScore)"
    }
}


import UIKit

class PlayerInfoView: UIView {
    @IBOutlet weak var pitcherName: UILabel!
    @IBOutlet weak var pitchingBallCount: UILabel!
    @IBOutlet weak var batterName: UILabel!
    @IBOutlet weak var batterGrade: UILabel!
    @IBOutlet weak var myDefense: UILabel!
    @IBOutlet weak var myAttack: UILabel!
    
    func applyPlayerInfo(pitcherName: String, pitchingBallCount: String, batterName: String, batterGrade: String) {
        self.pitcherName.text = pitcherName
        self.pitchingBallCount.text = pitchingBallCount
        self.batterName.text = batterName
        self.batterGrade.text = batterGrade
    }
    
    func applyMyTurn(turn: MyTeam) {
        if turn == .AWAY {
            myDefense.isHidden = true
            myAttack.isHidden = false
        } else {
            myDefense.isHidden = false
            myAttack.isHidden = true
        }
    }
}

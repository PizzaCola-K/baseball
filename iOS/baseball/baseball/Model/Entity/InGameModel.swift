
import Foundation

struct InGameModel {
    private var myTeam: MyTeam
    private var teamInfo: TeamInfo
    private var inningInfo: InningInfo
    private var pitcher: Pitcher
    private var batter: Player
    private var baseState: [Bool]
    
    init() {
        self.myTeam = .None
        self.teamInfo = TeamInfo.init()
        self.inningInfo = InningInfo()
        self.pitcher = Pitcher()
        self.batter = Player()
        self.baseState = []
    }
    
    mutating func set(team: MyTeam) {
        self.myTeam = team
    }
    
    func printt() {
        print(myTeam)
    }
}


import Foundation

class InGameModel {
    private(set) var myTeam: MyTeam
    private(set) var homeTeamInfo: TeamInfo
    private(set) var awayTeamInfo: TeamInfo
    private(set) var inningInfo: InningInfo
    private(set) var pitcher: Pitcher
    private(set) var batter: Player
    private(set) var baseState: [Bool]
    private var isDataChanged: Bool
    
    init() {
        self.myTeam = .None
        self.homeTeamInfo = TeamInfo.init()
        self.awayTeamInfo = TeamInfo.init()
        self.inningInfo = InningInfo()
        self.pitcher = Pitcher()
        self.batter = Player()
        self.baseState = []
        self.isDataChanged = true
    }
    
     func set(team: MyTeam) {
        self.myTeam = team
    }
    
     func updateGame(data: JSONRequestDTO) {
        self.isDataChanged = self.isChanged(data: data.game.history.reversed())
        self.homeTeamInfo.updateInfo(name: data.game.home.name, score: data.game.home.score)
        self.awayTeamInfo.updateInfo(name: data.game.away.name, score: data.game.away.score)
        self.inningInfo.updateData(currentInning: data.game.inning, attackTeam: data.game.state, batter: data.game.batter, strike: data.game.strike, ball: data.game.ball, out: data.game.out, history: data.game.history.reversed())
        if self.inningInfo.attackTeam == "AWAY" {
            self.pitcher.updatePitcher(name: data.game.home.pitcher.name, number: data.game.home.pitcher.number, pitches: data.game.home.pitcher.pitches)
        } else {
            self.pitcher.updatePitcher(name: data.game.away.pitcher.name, number: data.game.away.pitcher.number, pitches: data.game.away.pitcher.pitches)
        }
        self.batter.updatePlayer(name: data.game.batterInfo.name, atBat: data.game.batterInfo.atBat, hits: data.game.batterInfo.hits, out: data.game.batterInfo.out, average: data.game.batterInfo.average)
        self.baseState = data.game.baseState
        if isDataChanged {
            NotificationCenter.default.post(name: InGameModel.updateInGameModel, object: self)
        }
    }
    
    func currentInning() -> String {
        let away = "AWAY"
        var currentInningInfo = ""
        currentInningInfo += "\(self.inningInfo.currentInning)회"
        
        if self.inningInfo.attackTeam == away {
            currentInningInfo += "초"
        } else {
            currentInningInfo += "말"
        }
        
        return currentInningInfo
    }
    
    func myCurrentInningState() -> String {
        return self.inningInfo.attackTeam == self.myTeam.rawValue ? "공격" : "수비"
    }
    
    func currentBatterGrade() -> String {
        return "\(self.batter.atBat)타석 \(self.batter.hits)안타"
    }
    
    func currentMyState() -> MyTeam {
        switch myTeam {
        case .AWAY:
            return myTeam.rawValue == inningInfo.attackTeam ? myTeam : .HOME
        case .HOME:
            return myTeam.rawValue == inningInfo.attackTeam ? .AWAY : myTeam
        case .None:
            return .None
        }
    }
    
    func isChanged(data: [PitchingHistory]) -> Bool {
        return (self.inningInfo.pitchingHistory == data && self.pitcher.pitches != 0) ? false : true
    }
}

extension InGameModel {
    static let updateInGameModel = Notification.Name("updateInGameModel")
}

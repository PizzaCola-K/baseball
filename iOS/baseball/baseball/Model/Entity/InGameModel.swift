
import Foundation

struct InGameModel {
    private var myTeam: MyTeam
    private var homeTeamInfo: TeamInfo
    private var awayTeamInfo: TeamInfo
    private var inningInfo: InningInfo
    private var pitcher: Pitcher
    private var batter: Player
    private var baseState: [Bool]
    
    init() {
        self.myTeam = .None
        self.homeTeamInfo = TeamInfo.init()
        self.awayTeamInfo = TeamInfo.init()
        self.inningInfo = InningInfo()
        self.pitcher = Pitcher()
        self.batter = Player()
        self.baseState = []
    }
    
    mutating func set(team: MyTeam) {
        self.myTeam = team
    }
    
    mutating func updateGame(data: JSONRequestDTO) {
        self.homeTeamInfo.updateInfo(name: data.game.home.name, score: data.game.home.score)
        self.awayTeamInfo.updateInfo(name: data.game.away.name, score: data.game.away.score)
        self.inningInfo.updateData(currentInning: data.game.inning, attackTeam: data.game.state, batter: data.game.batter, strike: data.game.strike, ball: data.game.ball, out: data.game.out)
        self.pitcher.updatePitcher(number: data.game.home.pitcher.number, pitches: data.game.home.pitcher.pitches)
        self.batter.updatePlayer(name: data.game.batter.description/*temp*/, atBat: data.game.away.players[data.game.batter].atBat, hits: data.game.away.players[data.game.batter].hits, out: data.game.away.players[data.game.batter].out, average: data.game.away.players[data.game.batter].average)
        self.baseState = data.game.baseState
    }
    
    func 확인쓰(){
        print("===================", self.baseState)
    }
    
//    func updateInGameView선수() {
//        let tempTeam: Team = Team()
//        tempTeam.update(team: data.team){
//
//        }
//        inningInfo.getbatter == batterindex
//        teamteamFind(batter:) -> post
//    }
}

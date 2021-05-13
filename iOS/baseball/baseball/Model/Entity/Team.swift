
import Foundation

class Team {
    private var name: String
    private var score: Int
    private var players: Players
    private var pitcher: Pitcher
    
    init(name: String) {
        self.name = name
        self.score = 0
        self.players = Players()
        self.pitcher = Pitcher()
    }
    
    func updateTeamInfo(name: String, score: Int, players: [Player], pitcher: Pitcher) {
        self.name = name
        self.score = score
        self.players.update(players: players)
        self.pitcher.updatePitcher(name: pitcher.name, number: pitcher.number, pitches: pitcher.pitches)
    }
}

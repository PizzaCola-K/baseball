
import Foundation

class Team {
    private(set) var name: String
    private(set) var score: Int
    private(set) var players: Players
    private(set) var pitcher: Pitcher
    
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

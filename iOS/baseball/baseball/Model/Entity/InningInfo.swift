
import Foundation

struct InningInfo {
    private(set) var currentInning: Int
    private(set) var attackTeam: String
    private(set) var batter: Int
    private(set) var strike: Int
    var ball: Int
    private(set) var out: Int
    private(set) var pitchingHistory: PitchingHistory
    
    init() {
        self.currentInning = 0
        self.attackTeam = ""
        self.batter = 0
        self.strike = 0
        self.ball = 0
        self.out = 0
        self.pitchingHistory = PitchingHistory()
    }
    
    mutating func updateData(currentInning: Int, attackTeam: String, batter: Int, strike: Int, ball: Int, out: Int) {
        self.currentInning = currentInning
        self.attackTeam = attackTeam
        self.batter = batter
        self.strike = strike
        self.ball = ball
        self.out = out
    }//history update 필요!!!
}

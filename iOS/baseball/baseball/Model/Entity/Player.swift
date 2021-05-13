
import Foundation

class Player: Decodable {
    
    private(set) var name: String
    private(set) var atBat: Int
    private(set) var hits: Int
    private(set) var out: Int
    private(set) var average: Float
    
    init() {
        self.name = ""
        self.atBat = 0
        self.hits = 0
        self.out = 0
        self.average = 0
    }
    
    func updatePlayer(name: String, atBat: Int, hits: Int, out: Int, average: Float) {
        self.name = name
        self.atBat = atBat
        self.hits = hits
        self.out = out
        self.average = average
    }
}

extension Player: Hashable, Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.atBat == rhs.atBat && lhs.hits == rhs.hits && lhs.out == lhs.out && lhs.average == rhs.average
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(atBat)
        hasher.combine(hits)
        hasher.combine(out)
        hasher.combine(average)
    }
}

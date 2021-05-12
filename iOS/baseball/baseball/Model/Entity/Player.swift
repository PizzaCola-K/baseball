
import Foundation

struct Player: Decodable {
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
    
    mutating func updatePlayer(name: String, atBat: Int, hits: Int, out: Int, average: Float) {
        self.name = name
        self.atBat = atBat
        self.hits = hits
        self.out = out
        self.average = average
    }
}

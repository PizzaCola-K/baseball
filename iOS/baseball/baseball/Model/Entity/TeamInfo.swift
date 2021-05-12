
import Foundation

struct TeamInfo {
    private(set) var name: String
    private var score: Int
    
    init() {
        self.name = ""
        self.score = 0
    }
    
    mutating func updateInfo(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

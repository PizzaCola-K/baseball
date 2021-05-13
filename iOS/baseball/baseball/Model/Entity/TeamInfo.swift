
import Foundation

class TeamInfo {
    private(set) var name: String
    private(set) var score: Int
    
    init() {
        self.name = ""
        self.score = 0
    }
    
    func updateInfo(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

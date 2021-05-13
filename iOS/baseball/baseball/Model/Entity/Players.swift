
import Foundation

class Players: Decodable {
    private(set) var players: [Player]
    
    init() {
        self.players = []
    }
    
    func update(players: [Player]){
        self.players = players
    }
}

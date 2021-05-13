
import Foundation

class Players: Decodable {
    private var players: [Player]
    
    init() {
        self.players = []
    }
    
    func update(players: [Player]){
        self.players = players
    }
}


import Foundation

class InningScore: Decodable {
    private var home: [Int]
    private var away: [Int]
    
    init() {
        self.home = []
        self.away = []
    }
}

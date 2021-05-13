
import Foundation

class InningScore: Decodable {
    private(set) var home: [Int]
    private(set) var away: [Int]
    
    init() {
        self.home = []
        self.away = []
    }
}

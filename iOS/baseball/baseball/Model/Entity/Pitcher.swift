
import Foundation

struct Pitcher: Decodable {
    private var number: Int
    private var pitches: Int
    
    init() {
        self.number = 0
        self.pitches = 0
    }
}

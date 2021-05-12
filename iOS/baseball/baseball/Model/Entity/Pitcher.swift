
import Foundation

struct Pitcher: Decodable {
    private(set) var number: Int
    private(set) var pitches: Int
    
    init() {
        self.number = 0
        self.pitches = 0
    }
    
    mutating func updatePitcher(number: Int, pitches: Int){
        self.number = number
        self.pitches = pitches
    }
}

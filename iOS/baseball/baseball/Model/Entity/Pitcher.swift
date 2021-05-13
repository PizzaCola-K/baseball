
import Foundation

struct Pitcher: Decodable {
    private(set) var name: String
    private(set) var number: Int
    private(set) var pitches: Int
    
    init() {
        self.name = ""
        self.number = 0
        self.pitches = 0
    }
    
    mutating func updatePitcher(name: String, number: Int, pitches: Int){
        self.name = name
        self.number = number
        self.pitches = pitches
    }
}

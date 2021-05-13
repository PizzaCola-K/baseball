
import Foundation

class PitchingHistory: Decodable {
    private(set) var pitch: String
    private(set) var state: String
    
    init() {
        self.pitch = ""
        self.state = ""
    }
    
    func updatePitchingHistory(pitch: String, status: String) {
        
    }
}

extension PitchingHistory: Hashable, Equatable {
    static func == (lhs: PitchingHistory, rhs: PitchingHistory) -> Bool {
        return lhs.pitch == rhs.pitch && lhs.state == rhs.state
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(pitch)
        hasher.combine(state)
    }
}


import Foundation

class PitchingHistory: Decodable {
    
    enum Pitch: String {
        case STRIKE
        case BALL
        case OUT
        case FOUR_BALL
        case HIT
        case NONE
        
        var value: String {
            return rawValue
        }
    }
    
    private(set) var pitch: String
    private(set) var state: String
    
    init() {
        self.pitch = ""
        self.state = ""
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

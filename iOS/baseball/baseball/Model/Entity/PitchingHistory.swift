
import Foundation

class PitchingHistory: Decodable {
    private var pitch: String
    private var state: String
    
    init() {
        self.pitch = ""
        self.state = ""
    }
    
    func updatePitchingHistory(pitch: String, status: String) {
        
    }
}

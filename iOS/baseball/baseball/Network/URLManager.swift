
import Foundation

struct URLManager {
    enum Url: String {
        case gameList = "http://ec2-3-35-10-144.ap-northeast-2.compute.amazonaws.com/games/3"
    }
    
    static func get(url: Url) -> URL? {
        guard let url = URL(string: url.rawValue) else {
            print("The URL is inappropriate.")
            return nil
        }
        return url
    }
}

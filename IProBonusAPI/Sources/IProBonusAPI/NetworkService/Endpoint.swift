import Foundation

enum Endpoint {
    static let baseURL = URL(string: "https://mp1.iprobonus.com/api/v3")!
    
    case accessToken
    case generalInfo(String)
    
    var path: String {
        switch self {
        case .accessToken:
            return "clients/accesstoken"
        case .generalInfo(let accessToken):
            return "ibonus/generalinfo/\(accessToken)"
        }
    }
    
    var url: URL {
        return Endpoint.baseURL.appendingPathComponent(self.path)
    }
    
}


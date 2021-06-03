import Foundation

public enum Error: LocalizedError {
    case addressUnreachable(URL)
    case invalidResponse
    
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from the server"
        case .addressUnreachable(let url):
            return "Unreachable URL: \(url.absoluteString)"
        }
    }
}

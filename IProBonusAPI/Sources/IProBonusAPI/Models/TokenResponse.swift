import Foundation

public struct TokenResponse: Codable {
    public let resultOperation: ResultContent?
    public let accessToken: String
}

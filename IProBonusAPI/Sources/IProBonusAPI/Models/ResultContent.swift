import Foundation

public struct ResultContent: Codable {
    public let status: Int
    public let message: String?
    public let messageDev: String?
    public let codeResult: Int
    public let duration: Int
    public let idLog: String
}

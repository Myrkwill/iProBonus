import Foundation

public struct TokenRequest: Codable  {
    public let idClient: String
    public let accessToken: String
    public let paramName: String
    public let paramValue: String
    public let latitude: Double
    public let longitude: Double
    public let sourceQuery: Int
    
    public init(idClient: String, accessToken: String = "", paramName: String = "device", paramValue: String, latitude: Double = 0.0, longitude: Double = 0.0, sourceQuery: Int = 0) {
        self.idClient = idClient
        self.accessToken = accessToken
        self.paramName = paramName
        self.paramValue = paramValue
        self.latitude = latitude
        self.longitude = longitude
        self.sourceQuery = sourceQuery
    }

}

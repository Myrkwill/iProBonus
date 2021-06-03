import Foundation

public struct GeneralInfoResponse: Codable {
    public let resultOperation: ResultContent
    public let data: DataContent
}

public struct DataContent: Codable {
    public let typeBonusName: String
    public let currentQuantity: Int
    public let forBurningQuantity: Int
    public let dateBurning: Date
}


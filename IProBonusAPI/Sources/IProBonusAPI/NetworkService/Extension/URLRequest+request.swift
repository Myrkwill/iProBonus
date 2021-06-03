import Foundation

extension URLRequest {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Header {
        case accept
        case contentType
        case accessKey(String)
        
        var field: String {
            switch self {
            case .accept: return "Accept"
            case .contentType: return "Content-Type"
            case .accessKey: return "AccessKey"
            }
        }
        
        var value: String {
            switch self {
            case .accept: return "application/json"
            case .contentType: return "application/json"
            case .accessKey(let key): return key
            }
        }
    }
    
    mutating func setValue(_ header: Header) {
        setValue(header.value, forHTTPHeaderField: header.field)
    }
    
    mutating func setHttpMethod(_ httpMethod: HTTPMethod) {
        self.httpMethod = httpMethod.rawValue
    }
    
}

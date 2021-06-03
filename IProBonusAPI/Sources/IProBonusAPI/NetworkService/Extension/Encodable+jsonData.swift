import Foundation

extension Encodable {
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
}

import Foundation
import SwiftUI

class UserStore: ObservableObject {
    
    @Storage("clientID", default: "2c44d8c2-c89a-472e-aab3-9a8a29142315") var clientID {
        didSet { objectWillChange.send() }
    }
    
    @Storage("deviceID", default: "7db72635-fd0a-46b9-813b-1627e3aa02ea") var deviceID {
        didSet { objectWillChange.send() }
    }
    
    @Storage("titleSize", default: CGFloat(24)) var titleSize {
        didSet { objectWillChange.send() }
    }
    
    @Storage("descriptionSize", default: CGFloat(12)) var descriptionSize {
        didSet { objectWillChange.send() }
    }
    
    @Storage("backgroundColor", default: Color.red) var backgroundColor {
        didSet { objectWillChange.send() }
    }
    
}

extension UserStore: CustomStringConvertible {
    
    var description: String {
        return """
        Client ID: \(clientID)
        Device ID: \(deviceID)
        """
    }
    
}

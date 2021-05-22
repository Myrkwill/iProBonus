import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    @Published var clientID: String
    @Published var deviceID: String
    @Published var titleSize: CGFloat
    @Published var descriptionSize: CGFloat
    @Published var mainColor: Color
    @Published var secondaryColor: Color
    
    init(userStore: UserStore) {
        clientID = userStore.clientID
        deviceID = userStore.deviceID
        titleSize = userStore.titleSize
        descriptionSize = userStore.descriptionSize
        mainColor = userStore.mainColor
        secondaryColor = userStore.secondaryColor
    }
        
}

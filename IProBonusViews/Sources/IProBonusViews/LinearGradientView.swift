import SwiftUI

public struct LinearGradientView: View {
    
    let colors: [Color]
    
    public init(colors: [Color] = [.strawberryRed, .deepYellowPink]) {
        self.colors = colors
    }
    
    public var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
    
}



import SwiftUI

public struct LogoNavigationView: View {
    
    let logo: String
    let logoSize: CGFloat
    let logoColor: Color
    let buttonColor: Color
    let onInfoPressed: (() -> Void)?
    
    public init(logo: String, logoSize: CGFloat = 20, logoColor: Color = .black,  buttonColor: Color = .strawberryRed, onInfoPressed: (() -> Void)? = nil) {
        self.logo = logo
        self.logoSize = logoSize
        self.logoColor = logoColor
        self.buttonColor = buttonColor
        self.onInfoPressed = onInfoPressed
    }
    
    public var body: some View {
        HStack{
            Text(logo)
                .font(.system(size: logoSize))
                .foregroundColor(logoColor)
                .fontWeight(.light)
                .lineLimit(1)
            
            Spacer()
            
            Button(action: onInfoPressed ?? {}, label: {
                Image(systemName: "info.circle.fill")
                    .font(.title)
                    .foregroundColor(buttonColor)
            })
           
        }
        .padding()
    }
    
}

#if DEBUG
struct LogoNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        LogoNavigationView(logo: "Logo")
    }
}
#endif

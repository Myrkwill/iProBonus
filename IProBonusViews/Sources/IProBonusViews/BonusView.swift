import SwiftUI

public struct BonusView: View {
    // MARK: 
    let numberOfBonuses: Int
    let numberOfBonusesForBurning: Int
    let nameOfBonus: String
    let dateBurning: Date
    
    // MARK: Colors
    var backgroundColor: Color
    var titleColor: Color
    var descriptionColor: Color
    var buttonColor: Color
    var shadowColor: Color
    
    // MARK: Fonts
    var titleSize: CGFloat
    var descriptionSize: CGFloat
    
    public init(numberOfBonuses: Int,
                numberOfBonusesForBurning: Int,
                nameOfBonus: String,
                dateBurning: Date,
                backgroundColor: Color = .white,
                titleColor: Color = .black,
                descriptionColor: Color = .gray,
                buttonColor: Color = .strawberryRed,
                shadowColor: Color = .gray,
                titleSize: CGFloat = 24,
                descriptionSize: CGFloat = 12,
                onInfoPressed: (() -> ())? = nil
    ) {
        self.numberOfBonuses = numberOfBonuses
        self.numberOfBonusesForBurning = numberOfBonusesForBurning
        self.nameOfBonus = nameOfBonus
        self.dateBurning = dateBurning
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
        self.buttonColor = buttonColor
        self.shadowColor = shadowColor
        self.titleSize = titleSize
        self.descriptionSize = descriptionSize
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
            
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(numberOfBonuses) бонусов")
                        .foregroundColor(titleColor)
                        .fontWeight(.bold)
                        .font(.system(size: titleSize))
                        .lineLimit(1)

                    HStack(spacing: 4) {
                        Text("\(dateBurning.short) сгорит")
                        Text("🔥")
                        Text("\(numberOfBonusesForBurning) бонусов")
                    }
                    .foregroundColor(descriptionColor)
                    .font(.system(size: descriptionSize))
                    .lineLimit(1)
                }
                .padding()
            

                Spacer()

                Image(systemName: "chevron.forward.circle")
                    .foregroundColor(buttonColor)
                    .font(.largeTitle)
                    .padding()
                
            }
        }
        .cornerRadius(20)
        .shadow(color: shadowColor, radius: 20)
        
    }
}

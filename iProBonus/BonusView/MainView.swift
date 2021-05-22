import SwiftUI
import IProBonusViews

struct MainView: View {
    
    @EnvironmentObject var userStore: UserStore
    @ObservedObject var viewModel: BonusViewModel
    @State var showSettingsView = false
    
    init(viewModel: BonusViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    LogoNavigationView(logo: "логотип", buttonColor: .strawberryRed, onInfoPressed: { self.showSettingsView = true })
                    
                    ZStack(alignment: .top) {
                        LinearGradientView(colors: [.strawberryRed, .deepYellowPink])
                            .frame(height: geometry.size.height / 7)
                            .offset(y: geometry.size.height / 7 * 0.5)
                        
                        BonusView(
                            numberOfBonuses: viewModel.numberOfBonuses,
                            numberOfBonusesForBurning: viewModel.numberOfBonusesForBurning,
                            nameOfBonus: viewModel.nameOfBonus,
                            dateBurning: viewModel.dateBurning,
                            backgroundColor: viewModel.backgroundColor,
                            titleSize: viewModel.titleSize,
                            descriptionSize: viewModel.descriptionSize
                        )
                        .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 7, alignment: .center)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView(userStore: userStore, showSheetView: $showSettingsView).navigationBarHidden(true)
        }
        .environmentObject(userStore)
    }
    
}

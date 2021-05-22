import SwiftUI
import IProBonusAPI
import IProBonusViews
import Combine

final class BonusViewModel: ObservableObject {
    
    @Published var numberOfBonuses: Int = 0
    @Published var numberOfBonusesForBurning: Int = 0
    @Published var nameOfBonus: String = ""
    @Published var dateBurning: Date = Date()
    @Published var mainColor: Color = Color.strawberryRed
    @Published var secondaryColor: Color = Color.deepYellowPink
    @Published var titleSize: CGFloat = 24
    @Published var descriptionSize: CGFloat = 12
    
    private let networkService = NetworkService.shared
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(userStore: UserStore) {
        print(userStore.description)
        mainColor = userStore.mainColor
        secondaryColor = userStore.secondaryColor
        titleSize = userStore.titleSize
        descriptionSize = userStore.descriptionSize
            
        let tokenRequest = TokenRequest(idClient: userStore.clientID, paramValue: userStore.deviceID)
        
        self.networkService.accessToken(tokenRequest)
            .flatMap { response in
                self.networkService.generalInfo(accessToken: response.accessToken)
            }
            .sink(
                receiveCompletion: {
                    switch $0 {
                    case .finished:
                        break
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                },
                receiveValue: { response in
                    self.numberOfBonuses = response.data.currentQuantity
                    self.numberOfBonusesForBurning = response.data.forBurningQuantity
                    self.nameOfBonus = response.data.typeBonusName
                    self.dateBurning = response.data.dateBurning
                }
            )
            .store(in: &self.cancellableSet)
    }
    
}

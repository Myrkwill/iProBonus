//
//  iProBonusApp.swift
//  iProBonus
//
//  Created by Mark Nagibin on 19.05.2021.
//

import SwiftUI

@main
struct iProBonusApp: App {
    
    @ObservedObject var userStore: UserStore = .init()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: BonusViewModel(userStore: userStore))
                .environmentObject(userStore)
        }
    }
    
}

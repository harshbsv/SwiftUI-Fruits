//
//  FruitsApp.swift
//  Fruits
//
//  Created by Harshvardhan Basava on 18/05/21.
//

import SwiftUI

@main
struct FruitsApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            if isOnboarding{
                OnboardingView()
            }else{
                ContentView()
            }
        }
    }
}

//
//  F33_AppApp.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

@main
struct F33_AppApp: App {
    @StateObject var tabRouter = TabBarRouter()
    
    var body: some Scene {
        WindowGroup {
            MainView(profilevm: ProfileViewModel(), tabRouter: tabRouter)
        }
    }
}

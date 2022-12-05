//
//  TabBarRouter.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

class TabBarRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case like
    case profile
}

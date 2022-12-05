//
//  MainView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var profilevm: ProfileViewModel
    @StateObject var tabRouter: TabBarRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch tabRouter.currentPage {
                case .home:
                    HomeView(viewmodel: HomeViewModel())
                case .like:
                    LikedView()
                case .profile:
                    MyCartView(vm: ProfileViewModel())
                }
                Spacer()
                
                HStack{
                    HStack{
                        switch tabRouter.currentPage {
                        case .home:
                            TabBarTitleView(title: "Explorer")
                        case .like:
                            TabBarTitleView(title: "Favorites")
                        case .profile:
                            TabBarTitleView(title: "My Profile")
                        }
                       
                        TabBarIconView(iconName: "house", tabRouter: tabRouter, assignedPage: .home)
                        TabBarIconView(iconName: "heart", tabRouter: tabRouter, assignedPage: .like)
                        TabBarIconView(iconName: "person", tabRouter: tabRouter, assignedPage: .profile)
                            .padding(.trailing, 30)
                    }
                    .frame(height: 72)
                    .background(Color("blackblue"))
                    .cornerRadius(30)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .padding(.bottom, 15)
        }.background(Color("background"))
    }
}


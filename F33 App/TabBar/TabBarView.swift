//
//  TabBarView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

struct TabBarTitleView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            Circle()
                .frame(width: 5, height: 5)
                .foregroundColor(.white)
            Text(title)
                .font(.system(size: 17))
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(width: 80)
                .lineLimit(1)
        }.padding(.leading, 30)
    }
}

struct TabBarTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarTitleView(title: "Explorer")
    }
}

struct TabBarIconView: View {
    
    let iconName: String
    @StateObject var tabRouter: TabBarRouter
    let assignedPage: Page
    
    var body: some View {
        HStack{
           Image(systemName: iconName)
//                .resizable()
                .frame(width: 17, height: 19)
                .foregroundColor(.white)
                .scaledToFit()
        }.padding(.leading, 20)
            .onTapGesture {
                tabRouter.currentPage = assignedPage
            }
    }
}

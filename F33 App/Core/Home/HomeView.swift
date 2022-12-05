//
//  HomeView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel: HomeViewModel
    @State var isPres: Bool = false
    var body: some View {
        ScrollView{
            VStack{
//                Location & Filter Options Button
                HStack{
                    Spacer()
                    Image("location")
                        .resizable()
                        .frame(width: 11, height: 13)
                    Text("Your Current Location")
                        .font(.system(size: 12))
                        .foregroundColor(Color("blackblue"))
                    Image(systemName: "chevron.down").resizable()
                        .font(.system(size: 10))
                        .frame(width: 8, height: 6)
                    Spacer()
                    Button {
                        isPres.toggle()
                    } label: {
                        Image("filter")
                            .resizable()
                            .frame(width: 11, height: 13)
                            .padding(.trailing, 10)
                    }

                }
                
//                Category View - Scroll View
                HStack{
                    Text("Select Category")
                        .font(.system(size: 25))
                        .foregroundColor(Color("blackblue"))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Spacer()
                    Button {
                        //
                    } label: {
                        Text("view all")
                            .font(.system(size: 12))
                            .foregroundColor(Color("orange"))
                        
                    }.padding(.trailing, 15).padding(.top, 15)
                    
                }
                ScrollView(.horizontal, showsIndicators: false){
                    CategoryScrollView(category: CategoryModel.generateStaticData())
                        .padding(.leading, 20)
                }
                
//                Search Bar
                SearchView(searchText: $viewmodel.searchText)
                
//                Hot Sales View - TabView Page Style
                HStack{
                    Text("Hot Sales")
                        .font(.system(size: 25))
                        .foregroundColor(Color("blackblue"))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Spacer()
                    Button {
                        //
                    } label: {
                        Text("see more")
                            .font(.system(size: 12))
                            .foregroundColor(Color("orange"))
                        
                    }.padding(.trailing, 15).padding(.top, 15)
                    
                }.padding(.top, 15)
                HotSalesView(storeData: $viewmodel.homeStore)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .cornerRadius(10)
                
//                Best Sellers View - Collection View
                HStack{
                    Text("Best Seller")
                        .font(.system(size: 25))
                        .foregroundColor(Color("blackblue"))
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Spacer()
                    Button {
                        //
                    } label: {
                        Text("view all")
                            .font(.system(size: 12))
                            .foregroundColor(Color("orange"))
                        
                    }.padding(.trailing, 15).padding(.top, 15)
                    
                }
                
                    BestSellersView(sellerData: $viewmodel.homeSellers)
//                if isPres {
//                    FilterView(isPres: $isPres)
//                        .padding(.top, 300)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
                Spacer()
            }.background(Color("background"))
                .onAppear{
                    viewmodel.getData()
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewmodel: HomeViewModel())
    }
}

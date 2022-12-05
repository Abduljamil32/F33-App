//
//  BestSellersView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 12/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct BestSellersView: View {
    
    @State var likedId = 0
    @Binding var sellerData: [BestSeller]
    
    let column = [
        GridItem(.flexible(minimum: 170)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: column, spacing: 10){
                ForEach(sellerData) { data in
                    VStack(alignment: .leading){
                        ZStack{
                            WebImage(url: URL(string: data.picture ?? "heart")).resizable()
                                .frame(width: 170, height: 150)
                                .scaledToFit()
                                .cornerRadius(10)
                            Button {
                                //Add to favorites
                                
                                
                                self.likedId = data.id!
                            } label: {
                                if likedId == data.id! {
                                    Image(systemName: "heart.fill").resizable()
                                        .foregroundColor(Color.red)
                                        .frame(width: 11, height: 10)
                                        .background(Circle()
                                            .foregroundColor(Color.white)
                                            .frame(width: 20, height: 20)
                                        )
                                }else {
                                    Image(systemName: "heart").resizable()
                                        .foregroundColor(Color.red)
                                        .frame(width: 11, height: 10)
                                        .cornerRadius(10)
                                        .background(Circle()
                                            .foregroundColor(Color.white)
                                            .frame(width: 20, height: 20)
                                        )
                                }
                            }.offset(x: 50, y: -60)
                        }
                        
                        HStack{
                            Text("$\(data.priceWithoutDiscount)")
                                .font(.system(size: 14))
                                .foregroundColor(Color("blackblue"))
                                .fontWeight(.bold)
                                .padding(.leading, 20)
                            Text("$\(data.discountPrice)")
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
                                .strikethrough()
                            Spacer()
                        }
                        Text(data.title).font(.system(size: 11))
                            .foregroundColor(Color("blackblue"))
                            .padding(.bottom, 10).padding(.leading, 20)
                            .lineLimit(1)
                    }.background(Color.white).cornerRadius(10)
                }
            }.padding(.horizontal)
            
        }
    }
}

struct BestSellersView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellersView(sellerData: .constant([BestSeller]()))
    }
}

// ForEach(sellerData) { data in
//VStack(alignment: .leading){
//    Button {
//        //add to favorites
//        isLiked.toggle()
//    } label: {
//        if isLiked == true {
//            Image(systemName: "heart.fill").resizable()
//                .foregroundColor(Color.red)
//                .frame(width: 11, height: 10)
//        }else {
//            Image(systemName: "heart").resizable()
//                .foregroundColor(Color.red)
//                .frame(width: 11, height: 10)
//        }
//    }
//
//    HStack{
//        Text("$\(data.priceWithoutDiscount)")
//            .foregroundColor(Color("blackblue"))
//            .font(.system(size: 16)).bold()
//
//        ZStack{
//            Text("$\(data.discountPrice)")
//                .foregroundColor(Color.gray)
//                .font(.system(size: 10))
//            VStack{}.foregroundColor(.black)
//                .frame(maxWidth: 35).frame(height: 1)
//        }
//
//        Spacer()
//    }.padding(.leading, 0)
//
//    Text(data.title)
//        .foregroundColor(Color("blackblue"))
//        .font(.system(size: 10))
//}.padding(10).frame(width: 180)
//    .background {
//        WebImage(url: URL(string: data.picture ?? "heart" )).resizable()
//            .frame(width: 170, height: 150)
//            .scaledToFit()
//            .cornerRadius(10)
//    }

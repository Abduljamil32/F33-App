//
//  HotSalesView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HotSalesView: View {
    @Binding var storeData: [HomeStore]
   
    var body: some View {
        // Image Corousel Slider that receives data from API
        TabView{
            // TO DO:
            // use loop below any hstack
            ForEach(storeData) { data in
                VStack{
                    HStack{
                        if data.isNew != nil{
                            Text("New")
                                .foregroundColor(Color.white)
                                .font(.system(size: 12))
                                .background {
                                    Circle().foregroundColor(Color("orange"))
                                        .frame(width: 27, height: 27)
                                }.padding(.leading, 10)
                        }
                        Spacer()
                    }.padding(.bottom,18).padding(.leading, 10).padding(.top, 5)
                    
                    HStack{
                        Text(data.title ?? "Mobile Phone")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.leading, 10)
                        Spacer()
                    }.padding(.leading, 10)
                    
                    HStack{
                        Text(data.subtitle ?? "Super. Mega. Rapido")
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .lineLimit(1)
                            .padding(.leading, 10)
                        Spacer()
                    }.padding(.leading, 10).padding(.bottom, 20)
                    
                    HStack{
                        Button {
                            //add product to users cart
                        } label: {
                            Text("Buy Now!")
                                .foregroundColor(Color("blackblue"))
                                .font(.system(size: 17))
                                .bold()
                        }.background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.white)
                                .frame(width: 100, height: 25)
//                                .padding(.bottom, 20)
                        }.padding(.leading, 40)
                        Spacer()
                    }
                }.padding(0)
            }.background {
                WebImage(url: URL(string: storeData.first?.picture ?? "heart")).resizable()
                    .frame(width: UIScreen.main.bounds.width-20, height: 200)
                    .padding(10)
                    .scaledToFit()
                    .cornerRadius(45)
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct Hotsales_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesView(storeData: .constant([HomeStore]()))
    }
}





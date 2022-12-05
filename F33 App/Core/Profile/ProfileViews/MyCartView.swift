//
//  MyCartView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyCartView: View {
    @StateObject var vm: ProfileViewModel
  
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                
                Button {
                    //                    back button
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.white)
                }.frame(width: 37, height: 37)
                    .background(Color("blackblue"))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                
                Spacer()
                Text("Add address").font(.system(size: 15))
                    .foregroundColor(Color("blackblue"))
                    .fontWeight(.medium)
                    .padding(.leading, 50)
                    .padding(.trailing, 10)
                    .lineLimit(1)
                
                Button {
                    //
                } label: {
                    Image("location")
                        .frame(width: 37, height: 37)
                        .foregroundColor(.white)
                        .background(Color("orange"))
                        .cornerRadius(10)
                }.padding(.trailing, 10)
                
            }
            
            Text("My Cart")
                .font(.system(size: 35))
                .foregroundColor(Color("blackblue"))
                .padding(.top, 40).padding(.leading, 10)
                .fontWeight(.bold)
            
            // Buyed Items
            VStack(alignment: .leading){
                ForEach(vm.basketItem) { data in
                    HStack{
                        WebImage(url: URL(string: data.images)).resizable()
                            .frame(width: 110, height: 80)
                            .cornerRadius(10)
                            .padding(.leading, 10)
                        
                        VStack(alignment: .leading){
                            Text(data.title).font(.system(size: 20))
                                .lineLimit(0)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.leading, 10)
                            Text("$\(data.price)").font(.system(size: 17))
                                .foregroundColor(Color("orange"))
                                .padding(.leading, 10)
                        }
                        Spacer()
                        VStack(spacing: 4){
                            Button {
//                                -
                            } label: {
                                Image(systemName: "minus")
                                    .frame(width: 10)
                                    .foregroundColor(.white)
                            }
                            
                            Text("\(vm.basketItem.count)")
                                .foregroundColor(.white)
                                .font(.system(size: 20))

                            Button {
//                                -
                            } label: {
                                Image(systemName: "plus")
                                    .frame(width: 10)
                                    .foregroundColor(.white)
                            }

                        }.padding(8)
                        .background(Color("trashColor"))
                            .cornerRadius(10)
                            
                        Button {
//                            trash bin that removes items
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(Color("trashColor"))
                                .frame(width: 15, height: 16)
                                .padding(.trailing, 10).padding(.leading, 10)
                        }
                    }.padding(20)
                }
                
                Spacer()
                VStack{}.frame(width: UIScreen.main.bounds.width-8, height: 2)
                    .background(Color.gray.opacity(0.25)).padding(.bottom, 10)
                
                HStack{
                    Text("Total").foregroundColor(.white)
                        .font(.system(size: 15))
                        .fontWeight(.medium).padding(.leading, 30)
                    Spacer()
                    Text("\(vm.basketModel?.total ?? 0)")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .bold()
                }
                
                HStack{
                    Text("Delivery").foregroundColor(.white)
                        .font(.system(size: 15))
                        .fontWeight(.medium).padding(.leading, 30)
                    Spacer()
                    Text(vm.basketModel?.delivery ?? "")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .padding(.trailing, 30).padding(.top, 10)
                        .bold()
                }
                
                VStack{}.frame(width: UIScreen.main.bounds.width-16, height: 2)
                    .background(Color.gray.opacity(0.25))
                    .padding(.bottom, 10)
                
                Button {
                    // Chekout
                } label: {
                    HStack{
                        Spacer()
                        
                        Text("Chekout").foregroundColor(.white)
                            .padding(.trailing, 70).padding(.leading, 70)
                            .font(.system(size: 18))
                            .fontWeight(.bold).padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("orange"))
                            )
                            
                        Spacer()
                    }.padding(.bottom,10)
                        
                }

                
                
            }.frame(width: UIScreen.main.bounds.width, height: 500)
                .background(
                    RoundedCornersShape(corners: [.topLeft, .topRight], radius: 30)
                        .foregroundColor(Color("blackblue"))
                )
            
            
        }.onAppear{
            vm.getBasket()
        }
    }
}


struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

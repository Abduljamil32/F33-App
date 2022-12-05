//
//  ProductCorouselView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 16/12/22.
//

import SwiftUI

struct ProductCorouselView: View {
    
    //@StateObject var vm: ProductViewModel
   // @Binding var productmodel: ProductModel?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                ForEach(0..<4) { _ in
                    GeometryReader{ proxy in
                        let scale = getScale(proxy)
                        Image("test").resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 400)
                            .clipped()
                            .cornerRadius(10)
                            .scaleEffect(.init(width: scale, height: scale))
                            .animation(.easeOut(duration: 0.3))
                            .padding(.vertical)
                        
                    }.frame(width: 190, height: 400)
                    .padding(.horizontal,32).padding(.vertical, 32)
                }
                Spacer()
                    .frame(width: 50)
            }
        }
//        .onAppear{
//            vm.getData()
//        }
    }
    
    func getScale(_ proxy: GeometryProxy)-> CGFloat{
        let midPoint: CGFloat = 150
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        let deltaXAnimation: CGFloat = 150
    
        var scale: CGFloat = 1.0
        
        let difFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimation / 2)
        
        if difFromCenter < deltaXAnimation {
            scale = 1 + (deltaXAnimation - difFromCenter) / 500
        }
        
        return scale
    }
}


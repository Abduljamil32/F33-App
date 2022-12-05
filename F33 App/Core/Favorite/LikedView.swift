//
//  LikedView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

struct LikedView: View {
//    @StateObject var productvm: ProductViewModel
    
    var body: some View {
        VStack{
            // In this page should be Product Corousel View
            ProductCorouselView()
        }
    }
}

struct LikedView_Previews: PreviewProvider {
    static var previews: some View {
        LikedView()
    }
}

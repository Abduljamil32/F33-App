//
//  SearchView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 35)
                    .padding(.trailing, 15)
                    .foregroundColor(Color("orange"))
                
                TextField("Search", text: $searchText)
                    .foregroundColor(Color.black)
                    .disableAutocorrection(true)
                    .font(.system(size: 14))
            }.background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.white)
//                    .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                    .padding(.vertical, -6)
            )
            .padding(.leading, 10)
            
            Image(systemName: "qrcode")
                .background(
                    Circle()
                        .foregroundColor(Color("orange"))
                        .frame(width: 34, height: 34)
                )
                .foregroundColor(.white)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .padding(.trailing, 37).padding(.leading, 15)
                
        }.padding(.top, 35)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
    }
}

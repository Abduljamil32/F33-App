//
//  FilterView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 13/12/22.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var isPres: Bool
    @State var brandText: String = ""
    
    var body: some View {
        VStack{
            // Header Elements
            HStack{
                
                Button {
//                    back button
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color.white)
                        .bold()
                }.frame(width: 37, height: 37)
                    .background(Color("blackblue"))
                    .cornerRadius(10)
                    .padding(.leading, 10)
                
                Text("Filter Options").font(.system(size: 18))
                    .foregroundColor(Color("blackblue"))
                    .fontWeight(.medium)
                    .padding(.leading, 50)
                    .padding(.trailing, 30)
                    .lineLimit(1)
                Button {
//
                } label: {
                    Text("Done")
                        .foregroundColor(.white)
                        .frame(width: 75, height: 10)
                        .padding().bold()
                        .background(Color("orange"))
                        .cornerRadius(10)
                }.padding(.trailing, 10)
               
            }
            
            // Textfields
            VStack(alignment: .leading){
                Text("Brand").foregroundColor(Color("blackblue"))
                    .font(.system(size: 18))
                    .padding(.leading, 20).padding(.top, 20)
                TextField("Samsung/iPhone...", text: $brandText)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .padding(.vertical, -7)
                            .padding(.horizontal, -10)
                    )
                    .foregroundColor(Color("blackblue"))
                    .padding(.leading, 30).padding(.trailing, 30)
                    
                
                Text("Price").foregroundColor(Color("blackblue"))
                    .font(.system(size: 18))
                    .padding(.leading, 20).padding(.top, 20)
                TextField("$0 - $1000", text: $brandText)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .padding(.vertical, -7)
                            .padding(.horizontal, -10)
                    )
                    .foregroundColor(Color("blackblue"))
                    .padding(.leading, 30).padding(.trailing, 30)
                
                Text("Size").foregroundColor(Color("blackblue"))
                    .font(.system(size: 18))
                    .padding(.leading, 20).padding(.top, 20)
                TextField("0 to 0 inches", text: $brandText)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
                            .padding(.vertical, -7)
                            .padding(.horizontal, -10)
                    )
                    .foregroundColor(Color("blackblue"))
                    .padding(.leading, 30).padding(.trailing, 30)
            }
            
            }.padding(.leading,0)
        }
    }


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isPres: .constant(true))
    }
}

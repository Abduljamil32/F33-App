//
//  CategoryScrollView.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import SwiftUI

struct CategoryScrollView: View {
    
    @State var selectedId: Int = 0
    let category: [CategoryModel]
    
    var body: some View {
        HStack(spacing: 23) {
          ForEach(category, id: \.id) { data in
            VStack{
              ZStack{
                Circle()
                  .frame(width: 71, height: 71)
                  .foregroundColor(selectedId == data.id ? Color("orange") : .white)
                Image(data.imageName)
                  .frame(width: 18, height: 30)
                  .font(.system(size: 30))
                  .foregroundColor(selectedId == data.id ? .white : .gray)
              }.onTapGesture {
                selectedId = data.id
              }
              Text(data.name)
                .foregroundColor(selectedId == data.id ? Color("orange") : .black)
                .fontWeight(.semibold)
                .font(.system(size: 12))
                .frame(width: 70)
            }
          }
        }
    }
    
}

struct CategoryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScrollView(category: CategoryModel.generateStaticData())
    }
}

struct CategoryModel: Identifiable {
  let id:Int

  let name:String
  let imageName:String

  static func generateStaticData() -> [CategoryModel] {
    return [CategoryModel(
      id: 0,
      name: "Phones",
      imageName: "iphone"),
            CategoryModel(
              id: 1,
              name: "Computers",
              imageName: "computer"),
            CategoryModel(
              id: 2,
              name: "Health",
              imageName: "heart"),
            CategoryModel(
              id: 3,
              name: "Books",
              imageName: "book"),
            CategoryModel(
              id: 4,
              name: "Watches",
              imageName: "watch")]
  }
}

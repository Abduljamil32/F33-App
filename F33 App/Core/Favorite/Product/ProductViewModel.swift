//
//  ProductViewModel.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 17/12/22.
//

import Combine
import Foundation


class ProductViewModel: ObservableObject{
    
    @Published var model: ProductModel?
    
    let productUrl = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    var cancellable = Set<AnyCancellable>()
    
    func getData(){
        guard let url = URL(string: productUrl) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
//                print("\(data)")
                return data
                
            }
            .decode(type: ProductModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("completion: \(completion)")
            } receiveValue: { [weak self] (returnedData) in
                guard let self = self else { return }
                self.model = returnedData
               print(returnedData)
            }
            .store(in: &cancellable)
            
    }
}

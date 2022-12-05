//
//  ProfileViewModel.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 14/12/22.
//

import Foundation
import Combine


class ProfileViewModel: ObservableObject{
    
    @Published var basketModel: BasketModel?
    @Published var basketItem: [BasketItem] = []
    
    let cartUrl = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    var cancellable = Set<AnyCancellable>()
    
    func getBasket(){
        guard let url = URL(string: cartUrl) else { return }
        
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
            .decode(type: BasketModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("completion: \(completion)")
            } receiveValue: { [weak self] (returnedData) in
                guard let self = self else { return }
                self.basketModel = returnedData
                self.basketItem = returnedData.basket
            }
            .store(in: &cancellable)
    }
    
}

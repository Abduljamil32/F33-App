//
//  HomeViewModel.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 05/12/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var isLiked: Bool = false
    @Published var homeData: HomeModel?
    @Published var homeStore: [HomeStore] = []
    @Published var homeSellers: [BestSeller] = []
    
    let homeUrl = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
    
    var cancellable = Set<AnyCancellable>()
    
    func getData(){
        guard let url = URL(string: homeUrl) else { return }
        
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
            .decode(type: HomeModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("completion: \(completion)")
            } receiveValue: { [weak self] (returnedData) in
                guard let self = self else { return }
                self.homeStore = returnedData.homeStore
//                print(self.homeData)
                self.homeSellers = returnedData.bestSeller
            }
            .store(in: &cancellable)
            
    }

}

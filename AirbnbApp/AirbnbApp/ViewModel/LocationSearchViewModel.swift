//
//  LocationSearchViewModel.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/25.
//

import Foundation
import Combine

class LocationSearchViewModel {
    @Published var searchedPlaces = [Document]()
    private var subscriptions = Set<AnyCancellable>()
    
    private let lcoationSearchUseCase = LocationSearchUseCase()
    
    func searchPlaces(keyword: String) {
        lcoationSearchUseCase.searchLocations(keyword: keyword)
            .sink { result in
                switch result {
                case .failure(let networkError):
                    break
                    //assertionFailure("\(networkError)")
                case .finished:
                    break
                }
            } receiveValue: { places in
                self.searchedPlaces = places.documents
            }
            .store(in: &subscriptions)

    }
}

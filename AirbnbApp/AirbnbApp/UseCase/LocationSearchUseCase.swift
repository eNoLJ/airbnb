//
//  LocationSearchUseCase.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/25.
//

import Foundation
import Combine

class LocationSearchUseCase {
    private let locationNetworkManager = LocationNetworkManager()
    
    func searchLocations(keyword: String) -> AnyPublisher<Place, NetworkError> {
        locationNetworkManager.getLocations(query: keyword)
    }
}


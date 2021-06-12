//
//  LocationNetworkManager.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/25.
//

import Foundation
import Combine

class LocationNetworkManager {
    private let networkManager = NetworkManager()
    
    func getLocations(query: String) -> AnyPublisher<Place,NetworkError> {
        networkManager.get(url: Endpoint.kakaoMapURL(query: query), header: KakaoMapKey.restAPIKey)
    }
}

//
//  NetworkManager.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/25.
//

import Foundation
import Combine

class NetworkManager {
    
    func get<T>(url: URL?, header: String?) -> AnyPublisher<T,NetworkError> where T:Decodable {
        guard let myUrl = url else {
            return Fail(error: NetworkError.urlError).eraseToAnyPublisher()
        }
        var urlRequest = URLRequest(url: myUrl)
        
        if let header = header {
            urlRequest.addValue(KakaoMapKey.restAPIKey, forHTTPHeaderField: "Authorization")
        }

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { _ in NetworkError.networkConnection }
            .flatMap { data, response -> AnyPublisher<T, NetworkError> in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NetworkError.responseNil).eraseToAnyPublisher()
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    return Fail(error: NetworkError.unknown).eraseToAnyPublisher()
                }
                
                let decodeData = Just(data)
                    .decode(type: T.self, decoder: JSONDecoder())
                    .mapError { _ in NetworkError.parsing }.eraseToAnyPublisher()
                return decodeData
            }.eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case urlError
    case networkConnection
    case responseNil
    case parsing
    case unknown
}

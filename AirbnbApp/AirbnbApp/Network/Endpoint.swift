//
//  Endpoint.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/25.
//

import Foundation

struct Endpoint {
    static private(set) var kakaoMapURL: URL = URL(string: "http://dapi.kakao.com/v2/local/search/keyword.json")!
    private var path: String
    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = ""
        components.port = 3000
        components.path = ""
        
        let url = components.url

        return url
    }
    
    static func get(path: String) -> Self {

        return Endpoint(path: path)
    }
   
    static func kakaoMapURL(query: String) -> URL? {
        let encodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let kakaoMapURL = URL(string: "https://dapi.kakao.com/v2/local/search/keyword.json?query=\(encodedString)")
        return kakaoMapURL
    }
}

//
//  APIManager.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/26.
//

import Foundation
import SwiftyJSON

public enum Endpoint {
    fileprivate static let unsplash = "https://api.unsplash.com/search/photos/?client_id=\(APIKey.unsplashAcessKey)"
}

public final class APIManager {
    public static let shared = APIManager()
    private init() { }
    
    public static func fetchUnsplashImages(text: String,completion: @escaping ((JSON)-> Void)) {
        print("API Manager starts working")
        let url = URL(string:Endpoint.unsplash + "&query=\(text)")
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (100...500).contains(response.statusCode) else {
                    print(response)
                    return
                }
                
                if let data = data {
                    let json = JSON(data)
                    completion(json)
                    return
                }
            }.resume()
        }
    }
}

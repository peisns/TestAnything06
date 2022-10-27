//
//  ImageViewModel.swift
//  TestAnything06
//
//  Created by Brother Model on 2022/10/26.
//

import Foundation

class ImageViewModel {
    var list: Observable<[ImageInfo]> = Observable([])
    
    func fetch(query: String) {
        APIManager.fetchUnsplashImages(text: query) { json in
            print("API Manager is working to get Images")
            let array = json["results"].arrayValue
            var newList: [ImageInfo] = []
            array.forEach {
                let url = $0["urls"]["small"].stringValue
                newList.append(ImageInfo(url: url))
            }
            self.list.value = newList
        }
    }
}

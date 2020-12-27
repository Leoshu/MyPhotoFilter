//
//  NetworkManager.swift
//  MyPhotoFilter
//
//  Created by Leo on 2020/12/27.
//

import Foundation

class NetworkManager {
    static var shared = NetworkManager()
    private init() { }
    
    public func request(_ urlString: String? = "https://jsonplaceholder.typicode.com/photos", completion: @escaping (PhotoBean?, Error?) -> Void)  {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
              do {
                 let bean = try JSONDecoder().decode(PhotoBean.self, from: data)
                 completion(bean, nil)
              } catch let error {
                completion(nil, error)
              }
           }
        }.resume()
    }
}

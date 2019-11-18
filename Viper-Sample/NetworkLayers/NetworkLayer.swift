//
//  NetworkLayer.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/13/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import Alamofire
class NetworkLayer {
    static let instanse = NetworkLayer()
    func fetchData<T: Decodable>(url: String, completion: @escaping(T?, Error?) -> Void) {
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                do {
                    guard let data = response.data else { return }
                    let dataModel = try JSONDecoder().decode(T.self, from: data)
                    completion(dataModel, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
enum Result<T> {
    case success(T)
    case failure(Error)
}

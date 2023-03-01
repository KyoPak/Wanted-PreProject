//
//  NetworkService.swift
//  Wanted-PreProject
//
//  Created by parkhyo on 2023/03/01.
//

import UIKit

final class NetworkService {
    func request(_ request: URLRequest, completion: @escaping (Data) -> Void) {
        
        let urlSession = URLSession(configuration: .default)
        
        urlSession.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(NetworkError.networkError.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                print(NetworkError.reponseError.localizedDescription)
                return
            }
            
            guard let data = data else {
                print(NetworkError.noneDataError.localizedDescription)
                return
            }
            
            completion(data)
            
        }.resume()
    }
}

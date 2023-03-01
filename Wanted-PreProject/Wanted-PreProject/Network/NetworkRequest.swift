//
//  NetworkRequest.swift
//  Wanted-PreProject
//
//  Created by parkhyo on 2023/03/01.
//

import Foundation

enum NetworkReqeust: Int {
    case fisrtImage
    case secondImage
    case thirdImage
    case fourthImage
    case fifthImage
    
    var url: String {
        switch self {
        case .fisrtImage:
            return "https://wallpaperaccess.com/download/europe-4k-1369012"
        case .secondImage:
            return "https://wallpaperaccess.com/download/europe-4k-1318341"
        case .thirdImage:
            return "https://wallpaperaccess.com/download/europe-4k-1379801"
        case .fourthImage:
            return "https://wallpaperaccess.com/download/cool-lion-167408"
        case .fifthImage:
            return "https://wallpaperaccess.com/download/ironman-hd-323408"
        }
    }
    
    func generateRequest() throws -> URLRequest {
        guard let url = URLComponents(string: url)?.url else { throw NetworkError.networkError }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}

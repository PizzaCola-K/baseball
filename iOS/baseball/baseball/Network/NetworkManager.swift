//
//  NetworkManager.swift
//  baseball
//
//  Created by 박정하 on 2021/05/05.
//

import Foundation

struct NetworkManager {
    
    enum requestScene: String {
        case gameList = ""
        
        var value: String {
            return rawValue
        }
    }
    
    enum NetworkError: Error {
        case nilResponse
        case badResponse
    }
    
    enum httpMethod: String {
        case get = "GET"
        case post = "POST"
        
        var value: String {
            return rawValue
        }
    }
    
    static func getRequest<T:Decodable> (needs dataSet : T.Type, closure : @escaping (Result<T,NetworkError>) -> Void) {
        guard let url = URL.init(string: "http://3.36.239.71/games/5") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            let result = NetworkManager.decode(form : T.self, data: data)
            
            closure(result)
        }).resume()
    }
    
    static func postRequest<T:Decodable> (needs dataSet : T.Type, closure : @escaping (Result<T,NetworkError>) -> Void) {
        guard let url = URL.init(string: "http://3.36.239.71/games/5/pitch") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            let result = NetworkManager.decode(form : T.self, data: data)
            
            closure(result)
        }).resume()
    }
    
    private func checkResponse(response: URLResponse?) -> Result<Int,NetworkError> {
        guard let isresponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.nilResponse)
        }
        
        if isresponse.statusCode != 200 {
            return .failure(NetworkError.badResponse)
        }
        
        return .success(200)
    }
    
    static private func decode<T:Decodable> (form : T.Type, data: Data?) -> Result<T,NetworkError> {

        guard let data = data else {
            return .failure(NetworkError.nilResponse)
        }
        
        let decoder = try? JSONDecoder().decode(T.self, from: data)
        guard let returnData = decoder else {
            return .failure(NetworkError.badResponse)
        }
        return .success(returnData)
    }

}

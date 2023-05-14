//
//  NetworkManager.swift
//  AlamofireHomework
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
    func fetchGames(with url: URL, completion: @escaping(Result<[Game], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let games = Game.getGames(from: value)
                    completion(.success(games))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

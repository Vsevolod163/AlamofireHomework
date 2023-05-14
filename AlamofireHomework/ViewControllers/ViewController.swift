//
//  ViewController.swift
//  AlamofireHomework
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import UIKit

final class ViewController: UIViewController {

    private let networkManager = NetworkManager.shared
    private var allGames: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGames()
    }
    
    private func fetchGames() {
        let gamesURL = URL(string: "https://www.freetogame.com/api/games")!
        
        networkManager.fetchGames(with: gamesURL) { [weak self] result in
            switch result {
            case .success(let games):
                self?.allGames = games
                print(games)
            case .failure(let error):
                print(error)
            }
        }
    }
}


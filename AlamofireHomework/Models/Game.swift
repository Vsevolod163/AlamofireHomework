//
//  Game.swift
//  AlamofireHomework
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import Foundation

struct Game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let gameUrl: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    
    init(from courseData: [String: Any]) {
        id = courseData["id"] as? Int ?? 0
        title = courseData["title"] as? String ?? ""
        thumbnail = courseData["thumbnail"] as? String ?? ""
        gameUrl = courseData["game_url"] as? String ?? ""
        genre = courseData["genre"] as? String ?? ""
        platform = courseData["platform"] as? String ?? ""
        publisher = courseData["publisher"] as? String ?? ""
        developer = courseData["developer"] as? String ?? ""
        releaseDate = courseData["release_date"] as? String ?? ""
    }
    
    static func getGames(from value: Any) -> [Game] {
        guard let gamesData = value as? [[String: Any]] else { return [] }
        
        return gamesData.map { Game(from: $0) }
    }
}


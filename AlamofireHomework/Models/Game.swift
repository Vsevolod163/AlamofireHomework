//
//  Game.swift
//  AlamofireHomework
//
//  Created by Vsevolod Lashin on 14.05.2023.
//

import Foundation

struct Game: Decodable {
    let id: Int
    let title: String
    let thumbnail: String
    let description: String?
    let gameUrl: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let releaseDate: String
    let screenshots: [Screenshot]?
    
    init(
        id: Int,
        title: String,
        thumbnail: String,
        description: String?,
        gameUrl: String,
        genre: String,
        platform: String,
        publisher: String,
        developer: String,
        releaseDate: String,
        screenshots: [Screenshot]?
    ) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.description = description
        self.gameUrl = gameUrl
        self.genre = genre
        self.platform = platform
        self.publisher = publisher
        self.developer = developer
        self.releaseDate = releaseDate
        self.screenshots = screenshots
    }
    
    init(from courseData: [String: Any]) {
        id = courseData["id"] as? Int ?? 0
        title = courseData["title"] as? String ?? ""
        thumbnail = courseData["thumbnail"] as? String ?? ""
        description = courseData["description"] as? String ?? ""
        gameUrl = courseData["game_url"] as? String ?? ""
        genre = courseData["genre"] as? String ?? ""
        platform = courseData["platform"] as? String ?? ""
        publisher = courseData["publisher"] as? String ?? ""
        developer = courseData["developer"] as? String ?? ""
        releaseDate = courseData["release_date"] as? String ?? ""
        screenshots = courseData["screenshots"] as? [Screenshot] ?? []
    }
    
    static func getGames(from value: Any) -> [Game] {
        guard let gamesData = value as? [[String: Any]] else { return [] }
        
        return gamesData.map { Game(from: $0) }
    }
}

struct Screenshot: Decodable, Equatable {
    let image: URL
}

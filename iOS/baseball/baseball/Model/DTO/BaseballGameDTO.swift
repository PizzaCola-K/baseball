//
//  BaseballGameDTO.swift
//  baseball
//
//  Created by 박정하 on 2021/05/06.
//

import Foundation

struct JSONRequestDTO: Decodable {
    let game: GameDTO
}

struct GameDTO: Decodable {
    let home: TeamDTO
    let away: TeamDTO
    
    let inning: Int
    let state: String
    let batter: Int
    let strike: Int
    let ball: Int
    let out: Int
    
    let baseState: [Bool]
    let history: [String]
    let inningScore: InningScore
}

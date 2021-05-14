//
//  Game.swift
//  baseball
//
//  Created by 박정하 on 2021/05/14.
//

import Foundation

class GameModel: Decodable {
    var gameId: Int
    var home: String
    var away: String
}

//
//  InGameViewEntity.swift
//  baseball
//
//  Created by 박정하 on 2021/05/10.
//

import Foundation

struct InGameViewEntity {
    private let teamInfo: TeamInfo
    private let inningInfo: InningInfo
    private let pitcher: Pitcher
    private let batter: Player
    private let baseState: [Bool]
}

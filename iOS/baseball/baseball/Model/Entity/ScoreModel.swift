//
//  ScoreViewEntity.swift
//  baseball
//
//  Created by user on 2021/05/12.
//

import Foundation

class ScoreModel {
    private let Home: Team
    private let Away: Team
    private var inningScore: InningScore
    private var inningInfo: InningInfo
    
    init() {
        self.Home = Team(name: "")
        self.Away = Team(name: "")
        inningScore = InningScore()
        inningInfo = InningInfo()
    }
    
    func updateScoreModel(home: TeamDTO, away: TeamDTO, inningScore: InningScore, attackTeam: String) {
        self.Home.updateTeamInfo(name: home.name, score: home.score, players: home.players, pitcher: home.pitcher)
        self.Away.updateTeamInfo(name: away.name, score: away.score, players: away.players, pitcher: away.pitcher)
        self.inningScore = inningScore
        self.inningInfo.updateattackTeam(attackTeam: attackTeam)
    }
}

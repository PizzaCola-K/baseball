//
//  MyState.swift
//  baseball
//
//  Created by 박정하 on 2021/05/07.
//

import Foundation

enum MyTeam: String {
    case HOME
    case AWAY
    case None
    
    var Value: String {
        return rawValue
    }
}

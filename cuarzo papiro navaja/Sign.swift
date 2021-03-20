//
//  Sign.swift
//  cuarzo papiro navaja
//
//  Created by roger on 25/12/20.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign{
    let sign = randomChoice.nextInt()
    if sign == 0{
        return .rock
    } else if sign == 1{
        return .paper
    } else{
        return .scissors
    }
    
}

enum Sign {
    case scissors
    case rock
    case paper
    
    
    var emoji: String{
        switch self {
        case .scissors:
            return "✌️"
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        }
    }
    
    func compare(randomSign: Sign) -> GameState {
        switch (self, randomSign) {
        case (.scissors, .rock):
            return .lose
        case (.scissors, .paper):
            return .win
        case (.rock, .scissors):
            return .win
        case (.paper, .scissors):
            return .lose
        case (.rock, .paper):
            return .lose
        case (.paper, .rock):
            return .win
        default:
            return .draw
        }
    }
}

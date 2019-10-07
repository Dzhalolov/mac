//
//  Concentration1.swift
//  Concentration1
//
//  Created by xcode on 25.09.2019.
//  Copyright © 2019 VSU. All rights reserved.
//

import Foundation

class Concentration1
{
    
    var cards =  [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp=false
        }
        else{
            cards[index].isFaceUp=true
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
        let card = Card()
            cards += [card,card]
        }
        
    }
}


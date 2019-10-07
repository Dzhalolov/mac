//
//  ViewController.swift
//  Concentration1
//
//  Created by xcode on 18.09.2019.
//  Copyright © 2019 VSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration1(numberOfPairsOfCards:(cardButtons.count+1)/2)
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emoji=[Int:String]()
    
    var emojiChoices: Array<String> = ["🐸","🐢","🐊","🐍","🐸","🐢","🐊","🐍"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender){
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }
        else{
            print("Choosen card was not in array")
        }
        
    }
    
   /* @IBAction func restartGame(_ sender: UIButton){
    
        flipCount = 0
         for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                flipCard(button ,on:sender)}
            
        }

        
    }*/
    
    
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for:
                    UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            }
            else
            {
                button.setTitle("", for:
                    UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                
            }
        }
        
        
        
    }
    
    func emoji (for card:Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count>0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
    }
    
}


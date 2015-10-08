//
//  CardMatchingGame.swift
//  Machismo
//
//  Created by Aditya Koundinya on 10/17/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import Foundation

public class CardMatchingGame{
    
    init (count:Int, deck:Deck){
        for var i:Int = 0; i < count; i++ {
            let card = deck.drawRandomCard();
            if(card != nil){
                self.cards.append(card!);
            } else{
                break;
            }
        }
    }
    
    private var _score:Int = 0;
    private var cards:[Card] = []
    private var cardGame = 2;
    
    public var CardGame:Int {
        get{
            return cardGame;
        }
        set{
            var count:Int = 0
            for card:Card in self.cards{
                if(card.chosen){
                    count++
                }
            }
            if(count <= 0){
                cardGame = newValue;
            }

        }
    }
    
    private var chosenCards:[Card] = [Card]()
        
    private var cardsFaceUp: [Card]{
        get{
            var count:[Card] = [Card]();
            for card:Card in self.cards{
                if(card.chosen && !card.matched){
                    count.append(card)
                }
            }
            return count;
        }
    }
    
    public var lastGameScore: Int = 0;
    
    public var score:Int{
        get{
            return _score;
        }
    }
    
    let MISMATCH_PENALTY:Int = 2;
    let MATCH_BONUS:Int = 4;
    let COST_TO_CHOOSE:Int = 1;
    
    public func chooseCardAtIndex(index:Int){
        let card:Card = self.cards[index]
        lastGameScore = 0
        if(!card.matched){
            if(card.chosen){
                card.chosen = false
            }else{
                if((cardsFaceUp.count + 1) == CardGame){
                    lastGameScore = card.match(cardsFaceUp)
                    if(lastGameScore > 0){
                        lastGameScore += lastGameScore * MATCH_BONUS;
                        for i:Card in cardsFaceUp{
                            i.matched = true;
                        }
                        card.matched = true;
                    }else{
                        lastGameScore -= MISMATCH_PENALTY;
                        for i:Card in cardsFaceUp{
                            i.chosen = false;
                        }
                    }
                }
                card.chosen = true
                self._score += lastGameScore
                self._score -= COST_TO_CHOOSE;
            }
        }
    }
    
    public func cardAtIndex(index:Int) -> Card?{
        return index<self.cards.count ? self.cards[index]:nil;
    }
}
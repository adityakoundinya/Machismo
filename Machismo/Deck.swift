//
//  Deck.swift
//  Machismo
//
//  Created by Aditya Koundinya on 10/16/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import Foundation

public class Deck{
    
    init(){}
    
    var cards: [Card] = [];
    
    public func addCard(card:Card, atTop:Bool){
        if(atTop){
            self.cards.insert(card, atIndex: 0)
        }else{
            self.cards.append(card)
        }
    }
    
    public func addCard(card:Card){
        self.addCard(card, atTop: false)
    }
    
    public func drawRandomCard() -> Card?{
        
        var randomCard:Card? = nil
        
        if(self.cards.count > 0){
            let index = arc4random() % UInt32(self.cards.count);
            randomCard = self.cards[Int(index)]
            self.cards.removeAtIndex(Int(index));
        }
        
        return randomCard;
    }
    
}

//
//  PlayingCardDeck.swift
//  Machismo
//
//  Created by Aditya Koundinya on 10/17/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import Foundation

public class PlayingCardDeck: Deck{
    
    override init()  {
        super.init();
        for suit in PlayingCard.validSuits(){
            for var index = 0; index <= PlayingCard.maxRank(); index++ {
                let card: PlayingCard = PlayingCard();
                card.rank = UInt32(index);
                card.suit = suit;
                self.addCard(card);
            }
        }
    }
}
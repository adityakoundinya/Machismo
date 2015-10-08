//
//  PlayingCardGameViewController.swift
//  Machismo
//
//  Created by Aditya Koundinya on 11/20/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import Foundation

class PlayingCardGameViewController: ViewController{
    
    override func createDeck() -> Deck! {
        return PlayingCardDeck()
    }
    
    
}
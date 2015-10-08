//
//  Card.swift
//  Machismo
//
//  Created by Aditya Koundinya on 10/16/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import Foundation

public class Card {
    
    init(){}
    
    public var contents:String = "";
    
    public var chosen:Bool = false;
    
    public var matched:Bool = false;
    
    public func match(othercards:[Card]) -> Int {
        var score = 0;
        
        for card in othercards {
            if(card.contents == self.contents) {
                score = 1;
            }
        }
        return score;
    }
}
//
//  PlayingCard.swift
//  Machismo
//
//  Created by Aditya Koundinya on 10/16/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import Foundation

public class PlayingCard: Card{
    
    var _suit:String = "?";
    var _rank:UInt32 = 0;
    
    public class func validSuits()->[String]{
        return ["♥️","♠️","♣️","♦️"];
    }
    
    public class func maxRank() -> Int{
        return self.rankStrings().count - 1;
    }
    
    public class func rankStrings()->[String]{
        return ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    }
    
    public var suit:String {
        get{
            return _suit;
        }
        set{
            if(PlayingCard.validSuits().contains(newValue)){
                _suit = newValue;
            }
        }
    }
    
    public var rank:UInt32?{
        get{
            return _rank;
        }
        set{
            if(newValue < UInt32(PlayingCard.maxRank())){
                _rank = newValue!;
            }
        }
    }
    
    public override var contents:String {
        get{
            var rankStrings = PlayingCard.rankStrings();
            return "\(rankStrings[Int(self.rank!)])\(self.suit)";
        }
        set{
            
        }
    }
    
    public override func match(othercards: [Card]) -> Int {
        var score:Int = 0;
        
        for var i=0; i < othercards.count; i++ {
            
            let otherCard: PlayingCard = othercards[i] as! PlayingCard
            
            for var j = i+1; j<othercards.count; j++ {

                let nextCard: PlayingCard = othercards[j] as! PlayingCard
                
                if(otherCard.rank == nextCard.rank){
                    score++
                }else if(otherCard.suit == nextCard.suit){
                    score++
                }
            }
            
            if(otherCard.rank == self.rank){
                score++;
            }else if(otherCard.suit == self.suit){
                score++;
            }
        }
        return self.calculateScore(othercards.count + 1, numberofMatchedCards: score);
    }
    
    private func calculateScore(numberofCardsinGame: Int, numberofMatchedCards: Int) -> Int{
        if(numberofMatchedCards == 0){
            return 0;
        }
        
        if(numberofCardsinGame <= numberofMatchedCards + 1){
            return 4
        }
        
        if(numberofCardsinGame > numberofMatchedCards + 1){
            return 2
        }
        
        return 0
    }
}
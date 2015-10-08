//
//  ViewController.swift
//  Machismo
//
//  Created by Aditya Koundinya on 10/8/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var InfoLabel: UILabel!

    var _game:CardMatchingGame?;
    
    
    
    var game:CardMatchingGame {
        set{
            _game = newValue
        }get{
            if(_game == nil){
                _game = CardMatchingGame(count: cardButtons.count, deck: createDeck())
            }
            return _game!
        }
    }
    
    func createDeck() -> Deck!{
        return nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowHistory"){
            if(segue.destinationViewController.isKindOfClass(HistoryViewController)){
                let hvc: HistoryViewController = segue.destinationViewController as! HistoryViewController
                hvc.setHistory(NSAttributedString(string: self.InfoLabel.text!))
            }
        }
    }
    
    var currentGameChosenCards: [Card] = [Card]()
    
    @IBAction func cardFlipped(sender: UIButton) {
        
        var sum: Int = 0
        let n: Int = 1
        
        for(var i: Int = n; i > 0; i=i/4){
            for(var j: Int = 0; j < n^2; j++){
                sum++;
            }
        }
        
        self.game.CardGame = 2
        var lastChosenCard:Card = Card()
        let chosenButtonIndex:Int? = self.cardButtons.indexOf(sender)
        if(chosenButtonIndex != nil){
            self.game.chooseCardAtIndex(chosenButtonIndex!)
            if(currentGameChosenCards.count == self.game.CardGame){
                currentGameChosenCards.removeAll()
            }
            lastChosenCard = self.game.cardAtIndex(chosenButtonIndex!)!
            if(lastChosenCard.chosen){
                currentGameChosenCards.append(lastChosenCard)
                
            }else{
                let idx = (currentGameChosenCards as NSArray).indexOfObject(lastChosenCard)
                if(idx < currentGameChosenCards.count){
                    currentGameChosenCards.removeAtIndex(idx)
                }
            }
            
        }
        self.updateUI();
        
        if(self.game.lastGameScore < 0){
            let index = (currentGameChosenCards as NSArray).indexOfObject(lastChosenCard)
            currentGameChosenCards.removeRange(0...index-1)
        }
    }
    
    @IBAction func Redeal() {
        _game = CardMatchingGame(count: cardButtons.count, deck:PlayingCardDeck())
        currentGameChosenCards.removeAll(keepCapacity: false)
        self.updateUI()
    }
    
    func updateUI(){
        for cardButton in self.cardButtons{
            let chosenButtonIndex:Int? = self.cardButtons.indexOf(cardButton)
            let card:Card = self.game.cardAtIndex(chosenButtonIndex!)!
            cardButton.setTitle(self.titleForCard(card), forState: UIControlState.Normal);
            cardButton.setBackgroundImage(self.backgroundImageForCard(card), forState: UIControlState.Normal)
            cardButton.enabled = !card.matched
            self.scoreLabel.text = String("Score: \(self.game.score)");
        }
        updateInfo()
    }
    
    func titleForCard(card:Card) -> String{
        return card.chosen ? card.contents : ""
    }
    
    func backgroundImageForCard(card:Card) -> UIImage!{
        return UIImage(named: card.chosen ? "cardfront":"cardback")
    }
    
    func updateInfo(){
        
        InfoLabel.text = ""
        
        for var i = 0; i < currentGameChosenCards.count; i++ {
                InfoLabel.text! += "Card \(i + 1): \(self.currentGameChosenCards[i].contents)";
        }
        
        if(game.lastGameScore > 0){
            InfoLabel.text! +=  " Matched! \(game.lastGameScore) Points ";
        }else if(game.lastGameScore < 0){
            InfoLabel.text! += "Mismatch! \(game.lastGameScore) Penalty ";
        }
    }
}




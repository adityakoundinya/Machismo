//
//  HistoryViewController.swift
//  Machismo
//
//  Created by Aditya Koundinya on 11/19/14.
//  Copyright (c) 2014 Aditya Koundinya. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController{
    
    @IBOutlet weak var txtViewHistory: UITextView!

    @IBOutlet weak var txtHistory: UILabel!
    
    private var history:NSAttributedString?;

    required init(coder aDecoder: NSCoder){
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear (animated:Bool){
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        history = NSAttributedString(string: "Hi")
        self.updateUI()
    }

    
    func setHistory (gameHistory:NSAttributedString){
        self.history = gameHistory;
        if(self.view.window != nil){
            self.updateUI()
        }
    }
    
    func updateUI(){
        //self.txtHistory.text = self.history?.string
    }
}

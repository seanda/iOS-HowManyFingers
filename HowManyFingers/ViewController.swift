//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Sean Daniel on 2016-03-10.
//  Copyright © 2016 SeanDaniel.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fingers = arc4random_uniform(6)

    @IBOutlet weak var masterResult: UILabel!
    
    @IBOutlet weak var resultExplanation: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var fingerSelectorView: UISegmentedControl!
    
    @IBAction func fingerSelector(guess: AnyObject) {
        print("Guess is: " + guess.titleForSegmentAtIndex(Int(guess.selectedSegmentIndex))!)

        if Int(guess.titleForSegmentAtIndex(Int(guess.selectedSegmentIndex))!) == Int(fingers) {
            masterResult.text = "Correct!"
            masterResult.textColor = UIColor.greenColor()
            masterResult.alpha = 1
            
            resultExplanation.text = "Nailed it! I had \(fingers) fingers behind my back."
            resultExplanation.alpha = 1
            
            fingerSelectorView.enabled = false
            
            playAgainButton.alpha = 1
            
        } else {
            masterResult.text = "Incorrect!"
            masterResult.textColor = UIColor.redColor()
            masterResult.alpha = 1
        
            resultExplanation.text = "Nope! Play again."
            resultExplanation.alpha = 1
            
            fingerSelectorView.enabled = false
            
            playAgainButton.alpha = 1
        }
        
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        masterResult.alpha = 0
        resultExplanation.alpha = 0
        playAgainButton.alpha = 0
        fingerSelectorView.selectedSegmentIndex = -1
        fingerSelectorView.enabled = true
        
        // Choose a different number of fingers
        fingers = arc4random_uniform(6)
        print("Fingers behind back " + String(fingers))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Fingers behind back " + String(fingers))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


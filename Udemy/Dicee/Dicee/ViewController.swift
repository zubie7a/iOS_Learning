//
//  ViewController.swift
//  Dicee
//
//  Created by Zubieta on 4/13/19.
//  Copyright © 2019 zubie7a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0

    let diceArray = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateBothDices()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateDice(diceView : UIImageView) {
        // diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1 + 1)")
        // diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2 + 1)")
        let randomDiceIndex = Int(arc4random_uniform(6))
        diceView.image = diceArray[randomDiceIndex]
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateBothDices()
    }

    func updateBothDices() {
        updateDice(diceView : diceImageView1)
        updateDice(diceView : diceImageView2)
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBothDices()
    }
}


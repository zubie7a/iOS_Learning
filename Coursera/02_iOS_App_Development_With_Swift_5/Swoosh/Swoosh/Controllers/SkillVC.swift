//
//  SkillVC.swift
//  Swoosh
//
//  Created by Zubieta on 10/3/20.
//  Copyright © 2020 zubie7a. All rights reserved.
//

import UIKit

class SkillVC: UIViewController {

    var player : Player!

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // The value of `player` was set up on the segue transition
        // so this value has to be defined always.
        print(player.desiredLeague)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

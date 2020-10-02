//
//  LeagueVC.swift
//  Swoosh
//
//  Created by Zubieta on 10/3/20.
//  Copyright © 2020 zubie7a. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

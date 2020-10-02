//
//  ViewController.swift
//  Hello_Color
//
//  Created by Zubieta on 10/2/20.
//  Copyright © 2020 zubie7a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isPurple = false

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: Any) {

        print("Button was pressed!")
        if isPurple {
            // XCode automatically knows this view exists.
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.purple
        }

        // Flip the value of isPurple.
        isPurple = !isPurple
    }

}


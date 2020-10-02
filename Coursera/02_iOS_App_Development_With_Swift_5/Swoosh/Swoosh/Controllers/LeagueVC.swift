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

    @IBAction func onNextTapped(_ sender: Any) {

        // Programatical segues are good when you want to have
        // logic for what to transition next, which interface
        // builder doesn't allow to do programatically. In fact
        // many companies also dislike interface builder because
        // it's not possible to debug because it has no break
        // points, so they'd rather do everything in code.
        performSegue(withIdentifier: "skillVCSegue", sender: self)

        // A segue has to be created in IB, but only from VC to
        // VC, not from Button to VC, which means that anything
        // in the first VC can trigger it as long as it happens
        // from the code.
    }


    // This function was linked by dragging the "Back" button on the
    // second storyboard to the "Exit" icon of that ViewController,
    // then this function (which had to be defined previously) will
    // appear to be linked!
    @IBAction func unwindFromSkillVC(unwindSegue: UIStoryboardSegue) {
        // The function name doesn't matter, the parameter name also,
        // the only thing that matters is the type (UIStoryboardSegue)
        // and it will automatically know it has to go back to the
        // view of this controller.
    }
}

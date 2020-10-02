//
//  ViewController.swift
//  Swoosh
//
//  Created by Zubieta on 10/2/20.
//  Copyright © 2020 zubie7a. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var swoosh: UIImageView!

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!

    @IBOutlet weak var getStartedButton: BorderButton!

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // To hide the ugly navigation bar, because we need to use a
        // NavigationController to move between ViewControllers easily
        // with a proper transition (not modal or popover), however we
        // will need to define our custom functions to go back.
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Reset the UI Elements constraints with the view's current size.
        setUIElementsConstraints(view.frame.size)
    }

    // This function is called when the view will transition size.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        // Reset the UI Elements constraints, but instead of using the
        // view's current size, use the size it will transition to.
        setUIElementsConstraints(size)
    }

    func setUIElementsConstraints(_ newSize: CGSize) {
        // OH NO, I accidentally the whole Auto-Layout constraints.
        // What do I do? I forgot how to add them with Storyboards.
        // Fear not, we can do it programatically! Yay!

        // The only disadvantaeg of this against storyboard is that
        // storyboard gives a preview without having to run the app,
        // but managing the constraints there can become quite a mess
        // while programatically you have more control but you have
        // to run the app to actually see how it looks!

        let w = newSize.width
        let cX = w / 2

        let swooshX = cX - swoosh.frame.size.width / 2
        // let cy = view.frame.size.height / 2 - swoosh.frame.size.height / 2
        // Center horizontally, put a distance from the top of 50,
        swoosh.frame = CGRect(x: swooshX, y: 50,
                              width: swoosh.frame.width,
                              height: swoosh.frame.height
        )

        // Now make the first text relative to the logo.
        let t1X = cX - text1.frame.size.width / 2
        let t1Y = swoosh.frame.maxY + 50
        text1.frame = CGRect(x: t1X, y: t1Y,
                             width: text1.frame.width,
                             height: text1.frame.height)

        // Make the second text centered but vertically relative to first.
        let t2X = cX - text2.frame.size.width / 2
        let t2Y = text1.frame.maxY + 10
        text2.frame = CGRect(x: t2X, y: t2Y,
                             width: text2.frame.width,
                             height: text2.frame.height)

        // Make the third text centered but vertically relative to second.
        let t3X = cX - text3.frame.size.width / 2
        let t3Y = text2.frame.maxY + 10
        text3.frame = CGRect(x: t3X, y: t3Y,
                             width: text3.frame.width,
                             height: text3.frame.height)

        // Make the get started button centered but relative to view height.
        let gsbX = cX - getStartedButton.frame.size.width / 2
        let gsbY = newSize.height - getStartedButton.frame.height - 10
        getStartedButton.frame = CGRect(x: gsbX, y: gsbY,
                                        width: getStartedButton.frame.width,
                                        height: getStartedButton.frame.height)

        // Finally, we have to make the background image fill the screen!
        // Be careful because this way it does stretching and depending on
        // the screen aspect ratio, we don't want to do stretching.
        bgImg.frame = CGRect(x: 0, y: 0,
                             width: newSize.width,
                             height: newSize.height)

        // We could definitely do a more clever way where instead of fitting,
        // we scale up the image while preserving its aspect ratio, until it
        // fills the screen, perhaps the image will be cropped a little.

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

    // This will hide the status bar to make the app fullscreen!
    override var prefersStatusBarHidden: Bool {

        return true
    }

}


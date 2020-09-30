//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Zubieta on 9/30/20.
//  Copyright © 2020 zubie7a. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton:  UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var revButton:  UIButton!
    @IBOutlet weak var stopButton: UIButton!


    var recordedAudioURL: URL!
    // These types comes from AVFoundation.
    // These variables are not explicitly used in this clase but
    // are used plenty in the extension class, but declare here.
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int { case fast = 0, slow, high, low, echo, rev }

    @IBAction func playSoundForButton(_ sender: UIButton) {

        print("Play sound button pressed.")

        // Set the tag values in the Attributes Inspector for
        // each one of the play sound buttons.
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .high:
            playSound(pitch: 1000)
        case .low:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .rev:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {

        print("Stop audio button pressed.")
        // To interrupt the AVAudioEngine and stop the playback.
        stopAudio()
    }


    override func viewDidLoad() {

        super.viewDidLoad()
        // The setting of this value happens while preparing the
        // segue on the previous view controller so I guess it will
        // be ready by now?
        print(recordedAudioURL!)
        // Function from the extension file.
        setupAudio()
    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        // .notPlaying comes from PlayingState enum in the extension file.
        configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
        Stack Views:
        In this view controller we'll use Stack Views. These
        allows us to put several elements inside of them, and
        it will automatically apply Auto Layout inside. We can
        then create one big Vertical Stack View, inside of it
        put three Horizontal Stack Views, and inside of each
        put two buttons, creating a 3x2 grid of buttons.

        1. Drag a Vertical Stack View to the view in storyboard.
        2. Drag an arrow from it to its parent view.
        3. Select:
            * Leading Space To Safe Area
            * Top Space To Safe Area
            * Trailing Space To Safe Area
            * Bottom Space To Safe Area
        4. Once the 4 constrains are added, in the attributes
           inspector set the constant of each to 0, so that the
           Vertical Stack View takes the whole space of the view.
        5. Make sure the Vertical Stack View has the properties
           "Alignment" as "Fill", "Distribution" as "Fill Equally"
           with the "Spacing" property set to 0.
        6. Drag an Horizontal Stack View inside of the Vertical
           Stack View and set the same properties as step 5.
     */
}

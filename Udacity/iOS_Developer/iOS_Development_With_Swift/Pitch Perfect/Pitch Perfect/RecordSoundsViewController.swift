
// Used for interface stuff.
import UIKit

// Used for Audio/Video recording.
import AVFoundation


// This ViewController was embedded inside a NavigationController:
// 1. Select the View Controller in Storyboard.
// 2. Editor -> Embed In -> Navigation Controller.
class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    // This button is used to transition to a new ViewController.
    // In Storyboard, draw the arrow from button to the new View
    // Controller, and there select "Action Segue: Show".
    @IBOutlet weak var stopRecordingButton: UIButton!

    // Object used to record audio.
    var audioRecorder: AVAudioRecorder!

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view,
        // typically from a nib.

        // By default disable the "Stop Recording" button.
        stopRecordingButton.isEnabled = false
        // Alternatively could just make it invisible, but
        // still takes space and elements relative to it
        // remain in their position as if this was there.
        // stopRecordingButton.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {

        // Call the parent implementation before doing our
        // own custom stuff.
        super.viewDidAppear(animated)
    }

    // Action associated with recordButton.
    @IBAction func recordAudio(_ sender: Any) {

        print("Record button was pressed.")
        // This will change the text of the label in the view.
        recordingLabel.text = "Recording in Progress"
        // Enable the stop recording button because we have started
        // recording.
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false

        // Directory for /Users/{username}/Library/Developer/CoreSimulator
        // /Devices/{UUID}/data/Containers/Data/Application/{UUID}/Documents
        // Basically it's the application's Documents directory.
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

        // The name of the file we want to create.
        let recordingName = "recordedVoice.wav"
        // Join the directory path and the name of the recording.
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        // AVAudioSession is needed to record or playback audio. The shared
        // instance is an instance that has been created by default once
        // the app starts running. It is an abstraction of the entire audio
        // hardware, since there's only one audio hardware in the device,
        // then there's only one instance of AVAudioSession.
        let session = AVAudioSession.sharedInstance()

        // This try syntax means it doesn't handle any errors if the line
        // of code fails.
        try! session.setCategory(AVAudioSession.Category.playAndRecord,
                                mode: AVAudioSession.Mode.default,
                                options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    // Action associated with stopRecordingButton.
    @IBAction func stopRecording(_ sender: Any) {

        print("Stop Recording button was pressed.")
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
        // Change the text in of the label back to original.
        recordingLabel.text = "Tap to record"
    }
}


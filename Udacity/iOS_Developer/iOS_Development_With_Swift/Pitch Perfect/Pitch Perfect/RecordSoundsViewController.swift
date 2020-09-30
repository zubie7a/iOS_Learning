
// Used for interface stuff.
import UIKit

// Used for Audio/Video recording.
import AVFoundation

// FOR RECORDING TO WORK, YOU NEED TO ADD THIS KEY IN `info.plist`:
//      NSMicrophoneUsageDescription
// Otherwise it won't work in actual devices (does in simulator).

// This ViewController was embedded inside a NavigationController:
// 1. Select the View Controller in Storyboard.
// 2. Editor -> Embed In -> Navigation Controller.

// We need to tell XCode that RecordSoundsViewController conforms
// to the AVAudioRecorder delegate protocol, that is to say, we'll
// implement a function described in that delegate protocol, so
// that our view controller can act as a delegate for the class
// AVAudioRecorder.
class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    // A class in Swift can only inherit from one super class, but it can
    // conform to as many protocols as we want.

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
        // Tell the AVAudioRecorder that it can delegate stuff to this class.
        audioRecorder.delegate = self
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

        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)

        // Everytime the button is pressed, the Storyboard will
        // perform the segue to the second view, but what if we
        // want to transition once the sound has finished being
        // written? We'd need to transition via code, not via
        // the interface.

        // 1. Go ahead and manually delete the segue between
        // stopRecordingButton and the second storyboard.
        // 2. After that, drag an arrow between the first
        // view controller and the second one, then select
        // "Manual Segue" "Show". This will create a segue
        // between both storyboards, that can be called via
        // a special method.
        // 3. In the attributes inspector, give the segue
        // a unique name so we can know how to refer to it.
        // 4. We need to know when the AVAudioRecorder has
        // finished writing the .wav file, and to do that
        // we need to use a concept called Delegation.
    }

    // This function was autocompleted because XCode knows that
    // this class is a delegate of AVAudioRecorder.
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {

        print("Finished recording!")
        // This method should call the programatical segue to move
        // onto the next view.
        // Instead of sending the audio to the next view,
        // we send the file path that was created.
        if flag {
            // Perform a segue with the id we created, and sending as payload `Any?` type.
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Recording was not successful...")
        }
    }
 
    /*
        In a storyboard-based application, you will often want to do
        a little preparation before navigation:

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
         }
     */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Check if this is the segue that we want.
        if segue.identifier == "stopRecording" {
            // `segue.destination` is a generic UIViewController so we
            // have to upcast it to the PlaySoundsViewController type.
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

}


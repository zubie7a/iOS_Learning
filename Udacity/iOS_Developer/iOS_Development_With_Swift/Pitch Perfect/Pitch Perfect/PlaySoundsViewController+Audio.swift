//
//  PlaySoundsViewController+Audio.swift
//  Pitch Perfect
//
//  Copyright 2016 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - PlaySoundsViewController: AVAudioPlayerDelegate

// This is an extension of the PlaySoundsViewController class, with
// functions to make it easier to do audio playing operations and
// delegate functions.
extension PlaySoundsViewController: AVAudioPlayerDelegate {

    // MARK: Alerts

    struct Alerts {
        static let DismissAlert = "Dismiss"
        static let RecordingDisabledTitle = "Recording Disabled"
        static let RecordingDisabledMessage
            = "You've disabled this app from recording your microphone. Check Settings."
        static let RecordingFailedTitle = "Recording Failed"
        static let RecordingFailedMessage = "Something went wrong with your recording."
        static let AudioRecorderError = "Audio Recorder Error"
        static let AudioSessionError = "Audio Session Error"
        static let AudioRecordingError = "Audio Recording Error"
        static let AudioFileError = "Audio File Error"
        static let AudioEngineError = "Audio Engine Error"
    }

    // MARK: PlayingState (raw values correspond to sender tags)

    enum PlayingState { case playing, notPlaying }

    // MARK: Audio Functions

    func setupAudio() {
        // initialize (recording) audio file
        do {
            audioFile = try AVAudioFile(forReading: recordedAudioURL as URL)
        } catch {
            showAlert(Alerts.AudioFileError, message: String(describing: error))
        }
    }

    // This function uses named parameters and may receive
    // some or none of them, so it can be called in many ways.
    func playSound(rate: Float? = nil, pitch: Float? = nil,
                   echo: Bool = false, reverb: Bool = false) {

        // It seems that for playing a sound, you create an
        // audio engine, and then you start attaching to it
        // nodes/units that perform different operations,
        // and then you link all of them together to apply
        // all the required operations before playing sound.

        // Initialize audio engine components
        audioEngine = AVAudioEngine()

        // Node for playing audio
        audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)

        // Node for adjusting rate/pitch
        let changeRatePitchNode = AVAudioUnitTimePitch()
        // This is a way of saying if `pitch` is not nil.
        if let pitch = pitch {
            changeRatePitchNode.pitch = pitch
        }
        if let rate = rate {
            changeRatePitchNode.rate = rate
        }
        audioEngine.attach(changeRatePitchNode)

        // Node for echo
        let echoNode = AVAudioUnitDistortion()
        echoNode.loadFactoryPreset(.multiEcho1)
        audioEngine.attach(echoNode)

        // Node for reverb
        let reverbNode = AVAudioUnitReverb()
        reverbNode.loadFactoryPreset(.cathedral)
        reverbNode.wetDryMix = 50
        audioEngine.attach(reverbNode)

        // Connect nodes
        if echo == true && reverb == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, echoNode, reverbNode, audioEngine.outputNode)
        } else if echo == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, echoNode, audioEngine.outputNode)
        } else if reverb == true {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, reverbNode, audioEngine.outputNode)
        } else {
            connectAudioNodes(audioPlayerNode, changeRatePitchNode, audioEngine.outputNode)
        }

        // Schedule to play and start the engine!
        audioPlayerNode.stop()
        // This looks like a function, but it's actually a
        // trailing closure. These are chunks of code that
        // can be passed around just like regular variables.
        // The `scheduleFile` function takes a function that
        // it runs once the audioFile is ready to be played.
        audioPlayerNode.scheduleFile(audioFile, at: nil) {

            var delayInSeconds: Double = 0

            if let lastRenderTime = self.audioPlayerNode.lastRenderTime, let playerTime = self.audioPlayerNode.playerTime(forNodeTime: lastRenderTime) {

                if let rate = rate {
                    delayInSeconds = Double(self.audioFile.length - playerTime.sampleTime) / Double(self.audioFile.processingFormat.sampleRate) / Double(rate)
                } else {
                    delayInSeconds = Double(self.audioFile.length - playerTime.sampleTime) / Double(self.audioFile.processingFormat.sampleRate)
                }
            }

            // Schedule a stop timer for when audio finishes playing
            // to reset the buttons to the non played state.
            self.stopTimer = Timer(timeInterval: delayInSeconds, target: self, selector: #selector(PlaySoundsViewController.stopAudio), userInfo: nil, repeats: false)
            RunLoop.main.add(self.stopTimer!, forMode: RunLoop.Mode.default)
        }

        do {
            try audioEngine.start()
        } catch {
            showAlert(Alerts.AudioEngineError, message: String(describing: error))
            return
        }

        // Play the recording!
        audioPlayerNode.play()
    }

    @objc func stopAudio() {

        // This function is in charge of stopping the audio, either
        // when it actually finishes playing, or when it's manually
        // interrupted.

        if let audioPlayerNode = audioPlayerNode {
            audioPlayerNode.stop()
        }

        if let stopTimer = stopTimer {
            stopTimer.invalidate()
        }

        configureUI(.notPlaying)

        if let audioEngine = audioEngine {
            audioEngine.stop()
            audioEngine.reset()
        }
    }

    // MARK: Connect List of Audio Nodes

    func connectAudioNodes(_ nodes: AVAudioNode...) {
        for x in 0..<nodes.count-1 {
            audioEngine.connect(nodes[x], to: nodes[x+1], format: audioFile.processingFormat)
        }
    }

    // MARK: UI Functions

    // This function will set the state of the buttons, call it in viewWillAppear().
    func configureUI(_ playState: PlayingState) {
        switch(playState) {
        case .playing:
            setPlayButtonsEnabled(false)
            stopButton.isEnabled = true
        case .notPlaying:
            setPlayButtonsEnabled(true)
            stopButton.isEnabled = false
        }
    }

    func setPlayButtonsEnabled(_ enabled: Bool) {
        fastButton.isEnabled = enabled
        slowButton.isEnabled = enabled
        highButton.isEnabled = enabled
        lowButton.isEnabled = enabled
        echoButton.isEnabled = enabled
        revButton.isEnabled = enabled
    }

    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Alerts.DismissAlert, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

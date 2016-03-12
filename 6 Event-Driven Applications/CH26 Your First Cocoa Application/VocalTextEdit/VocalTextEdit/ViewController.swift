//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Brigitte Michau on 2016/03/09.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var stop: NSButton!
    @IBOutlet weak var speak: NSButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        stop.enabled = false
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        
        speak.enabled = false
        stop.enabled = true
        
        if let contents = textView.string where !contents.isEmpty {
            speechSynthesizer.startSpeakingString(contents)
        } else {
            speechSynthesizer.startSpeakingString("The document is empty")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        
        speechSynthesizer.stopSpeaking()
    }
}

extension ViewController: NSSpeechSynthesizerDelegate {

    func speechSynthesizer(sender: NSSpeechSynthesizer,
        didFinishSpeaking finishedSpeaking: Bool) {
            
            speak.enabled = true
            stop.enabled = false
    }
}
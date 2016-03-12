//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Brigitte Michau on 2016/03/09.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
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
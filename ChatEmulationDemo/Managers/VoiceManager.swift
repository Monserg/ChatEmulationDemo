//
//  VoiceManager.swift
//  ChatEmulationDemo
//
//  Created by Sergey Monastyrskiy on 04.06.2020.
//  Copyright © 2020 Sergey Monastyrskiy. All rights reserved.
//

import Foundation
import AVFoundation

class VoiceManager: AVSpeechSynthesizer {
    // MARK: - Properties
    var complete: (() -> Void)!
    
    
    // MARK: - Initialization
    init(speechMessage: String, complete: @escaping (() -> Void)) {
        super.init()
        Logger.log(message: speechMessage, event: .debug)
        
        delegate = self

        let utterance = AVSpeechUtterance(string: speechMessage)
        utterance.rate = 0.5
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.volume = .infinity
        
        speak(utterance)
        self.complete = complete
    }
}


// MARK: - AVSpeechSynthesizerDelegate
extension VoiceManager: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        Logger.log(message: "run", event: .debug)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.complete()
    }
}

//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 29.08.23.
//

import Foundation
import AVFoundation

struct Sound {
    
    static func play() {
        let url = Bundle.module.url(forResource: "click", withExtension: "wav")!
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Error playing audio: \(error)")
        }
    }
    
}

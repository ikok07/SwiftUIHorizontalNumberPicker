//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 29.08.23.
//

import Foundation
import AVFoundation

struct Sound {
    
    class CustomBundle {}
    
    static func play() {
        let url = Bundle(for: CustomBundle.self).url(forResource: "click", withExtension: "wav", subdirectory: "Sounds")!
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Error playing audio: \(error)")
        }
    }
    
}

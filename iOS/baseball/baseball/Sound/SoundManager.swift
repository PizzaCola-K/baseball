//
//  SoundManager.swift
//  baseball
//
//  Created by 박정하 on 2021/05/14.
//

import Foundation
import AVFoundation

class SoundManager {
    static func playermp3Audio(audioPlayer: inout AVAudioPlayer, title: String) {
        let url = Bundle.main.url(forResource: title, withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
}

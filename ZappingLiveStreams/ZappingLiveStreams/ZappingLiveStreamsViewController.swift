//
//  ViewController.swift
//  ZappingLiveStreams
//
//  Created by David Cordero on 15.03.17.
//  Copyright © 2017 David Cordero. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ZappingLiveStreamsViewController: AVPlayerViewController {
    
    private var currentStream: Int = 0
    private let streams = [
        URL(string: "https://demo-hls5-live.zahs.tv/sd/master.m3u8?timeshift=3600")!,
        URL(string: "https://demo-hls5-live.zahs.tv/hd/master.m3u8?timeshift=3600")!
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requiresLinearPlayback = true
        play(stream: streams[currentStream])
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        
        for press in presses {
            switch press.type {
            case .leftArrow:
                fallthrough
            case .rightArrow:
                currentStream = currentStream == 0 ? 1 : 0
                play(stream: streams[currentStream])
                
            default:
                super.pressesBegan(presses, with: event)
            }
        }
    }
    
    // MARK: - Private
    
    private func play(stream: URL) {
        let asset = AVAsset(url: stream)
        let playetItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playetItem)
        player?.play()
    }
}

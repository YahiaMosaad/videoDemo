//
//  VideoPlayerView.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/19/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
import UIKit

//4 Add the AVFoundation import so we can use AVPlayerLayer and AVPlayer
import AVFoundation

class VideoPlayerView: UIView {
  // 7 Add player property so the video the layer shows can be updated
  var player: AVPlayer? {
    get {
      return playerLayer.player
    }

    set {
      playerLayer.player = newValue
    }
  }
  
  // 5 Override the layerClass
  override class var layerClass: AnyClass {
    return AVPlayerLayer.self
  }
  
  // 6 Add accessor for playerLayer so you don't need to
  var playerLayer: AVPlayerLayer {
    return layer as! AVPlayerLayer
  }
}

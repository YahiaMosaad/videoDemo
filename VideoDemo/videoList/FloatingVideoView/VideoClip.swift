//
//  videoClip.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/19/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
class VideoClip: NSObject {
  let url: URL
  
  init(url: URL) {
    self.url = url
    super.init()
  }
  
  class func allClips() -> [VideoClip] {
    var clips: [VideoClip] = []
    
//    // Add HLS Stream to the beginning of clip show
    let videosURLArray = ["https://content.jwplatform.com/manifests/yp34SRmf.m3u8", "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8", "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8", "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"]
    for videoURL in videosURLArray {
        let url = URL(string: videoURL)!
        
        let remoteVideo = VideoClip(url: url)
        clips.append(remoteVideo)
    }
    return clips
    }
}

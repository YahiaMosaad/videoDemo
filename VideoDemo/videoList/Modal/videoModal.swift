//
//  videoModal.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/18/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
struct videoModal: Decodable {
    var videosList: [videoObject]
}
struct videoObject: Decodable {
    var videoID: Int
    var videoName: String
    var videoURL: String
    var videoThumbnail: String
    var videoDesription: String
}

//
//  VideoDetailsVC.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/21/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import UIKit
import AVKit

class VideoDetailsVC: UIViewController {
    //MARK: Instance Variable
    var presenter: VideoDetailsPresenter!
    var video: videoObject?
    var player = AVPlayer()
    var playerController = AVPlayerViewController()


    //MARK: Outlets
    @IBOutlet weak var videoViewer: UIView!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(video as Any)
        // Do any additional setup after loading the view.
        presenter = VideoDetailsPresenter(view: self)
        presenter.viewDidLoad()
        addPlayer()
        self.title = video?.videoName
        self.urlLbl.text = video?.videoURL
        self.descLbl.text = video?.videoDesription
    }
    

    func addPlayer() {
        let videoURL = NSURL(string: video!.videoURL)
        player = AVPlayer(url: videoURL! as URL)
        playerController.player = player
        
        self.addChild(playerController)
        // Add your view Frame
        playerController.view.frame = self.videoViewer.bounds
        // Add subview in your view
        self.videoViewer.addSubview(playerController.view)
        playerController.didMove(toParent: self)
        
//        player.play()
    }

}

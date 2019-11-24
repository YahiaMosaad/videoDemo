//
//  VideoListVC.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/18/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import UIKit
import  AVKit

class VideoListVC: UIViewController {
    
    //MARK: Instace variables
    private var videoArray = [videoObject]()
    var presenter: videoListPresenter!
    let videoPreviewLooper = CustomVideoViewer(clips: VideoClip.allClips())
    var player = AVPlayer()
    var playerController = AVPlayerViewController()

    //MARK: Outlets
    @IBOutlet weak var smallVideoView: UIView!
    @IBOutlet weak var videosTableView: UITableView!{
        didSet {
            videosTableView.tableFooterView = UIView(frame: .zero)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        presenter = videoListPresenter(view: self)
        presenter.viewDidLoad()
        view.addSubview(videoPreviewLooper)

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        videoPreviewLooper.play()
    }
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
        videoPreviewLooper.pause()
    }
}


extension VideoListVC {
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
            
      videoPreviewLooper.frame = CGRect(x: view.bounds.width - 200 - 16, y: view.bounds.height - 150 - 16, width: 200, height: 150)
      videoPreviewLooper.backgroundColor = .black
    }
     @objc func playSmallPlayer(sender: UIButton){
               let buttonTag = sender.tag
        let videoURLStr = presenter.getSelectedURLForRow(selectedRow: buttonTag)
            let videoURL = NSURL(string: videoURLStr)
               player = AVPlayer(url: videoURL! as URL)
               playerController.player = player
               
               self.addChild(playerController)
               // Add your view Frame
               playerController.view.frame = smallVideoView.bounds
               // Add subview in your view
               self.smallVideoView.addSubview(playerController.view)
               playerController.didMove(toParent: self)
               player.play()
               smallVideoView.isHidden = false
               smallVideoView.alpha = 1.0
               UIView.animate(withDuration: 15.0, delay: 5.0, options: [], animations: {
                   self.smallVideoView.alpha = 0.0
               }) { (finished: Bool) in
                   self.smallVideoView.isHidden = true
                   self.player.pause()

               }
           }
   
}
extension CustomVideoViewer {
  override func layoutSubviews() {
    super.layoutSubviews()
    
    videoPlayerView.frame = bounds
    addSubview(videoPlayerView)
  }
}

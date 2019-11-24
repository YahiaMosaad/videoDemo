//
//  VideoListVC+PresenterDelagate.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/19/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
import UIKit
import AVKit

extension VideoListVC: videoListView, Popupable, Loadable {
   
    func showIndicator() {
        videosTableView.isHidden = true
        showLoadingIndicator()
    }
    func hideIndicator() {
        videosTableView.isHidden = false
        hideLoadingIndicator()
    }
    func fetchingDataSuccess() {
        videosTableView.reloadData()
    }
    func showError(error: String) {
        print(error)
    }
   
    func navigateToVideoDetailsScreen(video: videoObject) {
        performSegue(withIdentifier: "videoDetailsSegue", sender: video)
        
        /* Play video without detials view
        let videoURL = URL(string: video.videoURL)!
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
 */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "videoDetailsSegue") {
            let vc = segue.destination as! VideoDetailsVC
            vc.video = sender as? videoObject
        }
    }
    
}

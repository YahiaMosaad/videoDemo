//
//  videoListPresenter.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/19/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation

protocol videoListView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func navigateToVideoDetailsScreen(video: videoObject)
}

protocol VideoCellView {
    func displayVideoName(name: String)
    func displayDetails(desc: String)
    func displayImage(imageName: String)
}

class videoListPresenter {
    //MARK: VariablesInstance
    private weak var view: videoListView?
    private let interactor = VideoInteractor()
    private var videos = [videoObject]()

    init(view: videoListView) {
        self.view = view
    }
    func viewDidLoad() {
        
        getVideos()

    }
    func getVideos() {
        view?.showIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // your code here
            self.view?.hideIndicator()
            self.videos = self.interactor.loadJson(filename: "videos")!
            if self.videos.count > 0{
                self.view?.fetchingDataSuccess()
            }else {
                self.view?.showError(error: "Json Error")
            }
        }
       
    }
    func getVideosCount() -> Int {
        return videos.count
    }
    func getSelectedURLForRow(selectedRow: Int) -> String{
        return videos[selectedRow].videoURL
    }
    func configure(cell: VideoCellView, for index: Int) {
        let video = videos[index]
        cell.displayVideoName(name: video.videoName)
        cell.displayDetails(desc: video.videoDesription)
        cell.displayImage(imageName: video.videoThumbnail)
    }
    func didSelectRow(index: Int) {
        let video = videos[index]
        view?.navigateToVideoDetailsScreen(video: video)
    }
   
   
}



//
//  VideoDetailsPresenter.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/21/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
protocol videoDetailsView: class {
    func playVideo()
    func stopVideo()
}
class VideoDetailsPresenter {
    //MARK: VariablesInstance
    private weak var viewDetails: videoDetailsView?
    private let interactor = VideoInteractor()
    
    
    init(view: videoDetailsView) {
           self.viewDetails = view
       }
       func viewDidLoad() {
    
       }
   
}



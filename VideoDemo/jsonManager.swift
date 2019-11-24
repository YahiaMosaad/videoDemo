//
//  jsonManager.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/18/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
class jsonManager {
    static let shared = jsonManager()
    
    private init() { }
    
    func loadJson(filename fileName: String) -> [videoObject]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(videoModal.self, from: data)
                print(jsonData)
                return jsonData.videosList
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

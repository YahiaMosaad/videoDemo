//
//  UIImageView+maskCircle.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/21/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = .scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true

   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
   self.image = anyImage
  }
}

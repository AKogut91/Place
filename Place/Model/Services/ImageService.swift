//
//  ImageService.swift
//  Place
//
//  Created by AlexanderKogut on 9/14/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import Foundation
import SDWebImage

class ImageService {
    
    //Downloading and caching image from url
   static func loadAndShowPicture(imageCell: UIImageView , image: String?) {
        
        let stringURL = image
        let cellURL = URL(string:stringURL!)
        imageCell.sd_setShowActivityIndicatorView(true)
        imageCell.sd_setIndicatorStyle(.gray)
        
        DispatchQueue.main.async {

            imageCell.sd_setImage(with: cellURL) { (image, error, cache, urls) in
                if error != nil {
                    imageCell.image = UIImage(named: "logoIra_1")
                } else {
                    //Successful loading image
                    imageCell.image = image
                }
            }
        }
    }
}

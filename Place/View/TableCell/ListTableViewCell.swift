//
//  ListTableViewCell.swift
//  Place
//
//  Created by AlexanderKogut on 9/14/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static var heightCell = UIScreen.main.bounds.height / 3
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var placeTItel: UILabel!
    @IBOutlet weak var placeSubTitel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gradientView.addGradientLayer(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: ListTableViewCell.heightCell), colors: [GradientColors.topColor, GradientColors.midelColor, GradientColors.bottomColor])
    }
}

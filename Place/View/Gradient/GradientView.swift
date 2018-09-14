//
//  GradientView.swift
//  Place
//
//  Created by AlexanderKogut on 9/14/18.
//  Copyright © 2018 AlexanderKogut. All rights reserved.
//

import UIKit

class GradientColors {
    
    static var topColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 240/255.0, alpha: 0.4)
    static var midelColor = UIColor(red: 83/255.0, green: 105/255.0, blue: 118/255.0, alpha: 0.7)
    static var bottomColor = UIColor(red: 44/255.0, green: 62/255.0, blue: 80/255.0, alpha: 1.0)
}

extension UIView{
    
    func addGradientLayer(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
}

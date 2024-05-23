//
//  CustomImageView.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 21.05.2024.
//

import UIKit

class CustomImageView: UIImageView {
    
    var corners: UIRectCorner = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: corners, radius: 10)
    }
    
    private func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

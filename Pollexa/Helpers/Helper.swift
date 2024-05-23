//
//  Helper.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 19.05.2024.
//

import Foundation
import UIKit

func observeViewModel() {}

func observeDataSource() {}

public enum SectionType: Int, CaseIterable {
//    case search = 0
    case active
    case vote
    
}

public enum DiscoverSectionEnum: Int, CaseIterable {
//    case activePolls = 0
    case vote
}


extension UIView {
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    
    func bringToFront() {
        superview?.bringSubviewToFront(self)
    }
}

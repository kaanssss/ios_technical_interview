//
//  DiscoverDS.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 19.05.2024.
//

import Foundation
import UIKit

enum DiscoverDSStateChange: StateChange {
    
    case gotoPost(postID: String)
    
    
}

class DiscoverDS: StatefulDataSource<DiscoverDSStateChange> {
    
    var posts: [Post]? = []
    
    
}

extension DiscoverDS: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DiscoverSectionEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = DiscoverSectionEnum(rawValue: section)
        switch section {
        case .vote:
            let count = posts?.count ?? 0
            return count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DiscoverSectionEnum(rawValue: indexPath.section)
        switch section {
        case .vote:
            let identifier = String(describing: VoteCell.self)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? VoteCell else {
                return UITableViewCell()
            }
            
            if let post = posts?[indexPath.row] {
                cell.setCell(post: post)
                cell.delegate = self
            } else {
            }
            
            return cell
        case .none:
            break
        }
        return UITableViewCell()
    }
}

extension DiscoverDS: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
//        return UIView()
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DiscoverDS: ActivePollsCellDelegate {
    
}

extension DiscoverDS: VoteCellDelegate {
    
}




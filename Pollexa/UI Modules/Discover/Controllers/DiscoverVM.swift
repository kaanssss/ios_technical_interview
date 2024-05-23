//
//  DiscoverVM.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 19.05.2024.
//

import Foundation

enum DiscoverVMStateChange: StateChange {
    case getListSuccess([Post]?)
    case getListError(String?)
}

class DiscoverVM: StatefulVM<DiscoverVMStateChange> {
    
    // MARK: - Properties
    var dataSource = DiscoverDS()
    var postProvider = PostProvider.shared
    
    // MARK: - Fetch Data
    func fetchData() {
        postProvider.fetchAll { [weak self] result in
            switch result {
            case .success(let posts):
                self?.emit(.getListSuccess(posts))
            case .failure(let error):
                self?.emit(.getListError(error.localizedDescription))
            }
        }
    }
}

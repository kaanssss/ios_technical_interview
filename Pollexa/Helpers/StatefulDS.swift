//
//  StatefulDS.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 19.05.2024.
//

import Foundation

class StatefulDataSource<StateChange>: NSObject {
    var dispatchGroup = DispatchGroup()
    
    typealias StateChangeHandler = ((StateChange) -> Void)
    
    private var stateChangeHandler: StateChangeHandler?
    
    final func subscribe(_ handler: @escaping StateChangeHandler) {
        stateChangeHandler = handler
    }
    
    final func emit(_ change: StateChange) {
        stateChangeHandler?(change)
    }
}

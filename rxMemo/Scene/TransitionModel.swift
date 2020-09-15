//
//  TransitionModel.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
    
}

enum TransitionError: Error {
    case NavigationControllerMissing
    case cannotPop
    case unknown
}

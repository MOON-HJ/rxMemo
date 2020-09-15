//
//  SceneCoordinatorType.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene : Scene, using style: TransitionStyle, animated:Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}

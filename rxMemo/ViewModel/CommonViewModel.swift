//
//  CommonViewModel.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
    let title : Driver<String>
    let sceneCoordinator: SceneCoordinator
    let storage:MemoStorageType
    
    init(title: String, sceneCoordinator: SceneCoordinator, storage: MemoStorageType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
